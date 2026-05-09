; DESCRIPTION: Draws a white line from (240, 41) to (85, 255).
; PLAN: r0=240(x1), r1=41(y1), r2=85(x2), r3=255(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 41
LDI r2, 85
LDI r3, 255
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
