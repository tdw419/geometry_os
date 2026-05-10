; DESCRIPTION: Renders a red line between points (436, 171) and (459, 228).
; PLAN: r0=436(x1), r1=171(y1), r2=459(x2), r3=228(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 171
LDI r2, 459
LDI r3, 228
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
