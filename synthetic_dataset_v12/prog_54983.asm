; DESCRIPTION: Renders a red line between points (173, 166) and (182, 53).
; PLAN: r0=173(x1), r1=166(y1), r2=182(x2), r3=53(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 166
LDI r2, 182
LDI r3, 53
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
