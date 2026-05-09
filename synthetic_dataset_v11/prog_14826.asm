; DESCRIPTION: Renders a white line between points (203, 21) and (174, 64).
; PLAN: r0=203(x1), r1=21(y1), r2=174(x2), r3=64(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 21
LDI r2, 174
LDI r3, 64
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
