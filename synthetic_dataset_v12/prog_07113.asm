; DESCRIPTION: Places a green line segment connecting (217, 3) to (295, 101).
; PLAN: r0=217(x1), r1=3(y1), r2=295(x2), r3=101(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 3
LDI r2, 295
LDI r3, 101
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
