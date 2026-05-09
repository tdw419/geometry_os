; DESCRIPTION: Renders a orange line between points (456, 1) and (255, 223).
; PLAN: r0=456(x1), r1=1(y1), r2=255(x2), r3=223(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 1
LDI r2, 255
LDI r3, 223
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
