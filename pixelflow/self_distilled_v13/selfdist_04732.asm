; DESCRIPTION: Draws a white line from (83, 21) to (350, 14).
; PLAN: r0=83(x1), r1=21(y1), r2=350(x2), r3=14(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 21
LDI r2, 350
LDI r3, 14
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
