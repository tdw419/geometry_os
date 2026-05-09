; DESCRIPTION: Renders a white line between points (54, 30) and (255, 63).
; PLAN: r0=54(x1), r1=30(y1), r2=255(x2), r3=63(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 30
LDI r2, 255
LDI r3, 63
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
