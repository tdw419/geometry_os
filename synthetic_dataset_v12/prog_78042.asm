; DESCRIPTION: Places a yellow line segment connecting (292, 111) to (440, 210).
; PLAN: r0=292(x1), r1=111(y1), r2=440(x2), r3=210(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 111
LDI r2, 440
LDI r3, 210
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
