; DESCRIPTION: Places a yellow line segment connecting (327, 7) to (65, 171).
; PLAN: r0=327(x1), r1=7(y1), r2=65(x2), r3=171(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 7
LDI r2, 65
LDI r3, 171
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
