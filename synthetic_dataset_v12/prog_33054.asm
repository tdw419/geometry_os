; DESCRIPTION: Places a yellow line segment connecting (185, 228) to (176, 250).
; PLAN: r0=185(x1), r1=228(y1), r2=176(x2), r3=250(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 228
LDI r2, 176
LDI r3, 250
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
