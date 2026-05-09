; DESCRIPTION: Renders a cyan line between points (361, 56) and (454, 203).
; PLAN: r0=361(x1), r1=56(y1), r2=454(x2), r3=203(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 56
LDI r2, 454
LDI r3, 203
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
