; DESCRIPTION: Renders a green line between points (255, 251) and (344, 203).
; PLAN: r0=255(x1), r1=251(y1), r2=344(x2), r3=203(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 251
LDI r2, 344
LDI r3, 203
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
