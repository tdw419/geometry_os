; DESCRIPTION: Renders a red line between points (50, 213) and (255, 36).
; PLAN: r0=50(x1), r1=213(y1), r2=255(x2), r3=36(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 213
LDI r2, 255
LDI r3, 36
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
