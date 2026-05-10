; DESCRIPTION: Places a white line segment connecting (243, 3) to (283, 98).
; PLAN: r0=243(x1), r1=3(y1), r2=283(x2), r3=98(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 3
LDI r2, 283
LDI r3, 98
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
