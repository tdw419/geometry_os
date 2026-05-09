; DESCRIPTION: Renders a red line between points (104, 111) and (207, 255).
; PLAN: r0=104(x1), r1=111(y1), r2=207(x2), r3=255(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 111
LDI r2, 207
LDI r3, 255
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
