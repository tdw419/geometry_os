; DESCRIPTION: Places a blue line segment connecting (283, 27) to (361, 28).
; PLAN: r0=283(x1), r1=27(y1), r2=361(x2), r3=28(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 27
LDI r2, 361
LDI r3, 28
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
