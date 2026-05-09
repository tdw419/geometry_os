; DESCRIPTION: Renders a red line between points (213, 180) and (240, 67).
; PLAN: r0=213(x1), r1=180(y1), r2=240(x2), r3=67(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 180
LDI r2, 240
LDI r3, 67
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
