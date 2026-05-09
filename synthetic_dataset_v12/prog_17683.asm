; DESCRIPTION: Places a white line segment connecting (160, 209) to (402, 37).
; PLAN: r0=160(x1), r1=209(y1), r2=402(x2), r3=37(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 209
LDI r2, 402
LDI r3, 37
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
