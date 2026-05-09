; DESCRIPTION: Draws a red line from (116, 112) to (402, 228).
; PLAN: r0=116(x1), r1=112(y1), r2=402(x2), r3=228(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 112
LDI r2, 402
LDI r3, 228
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
