; DESCRIPTION: Renders a red line between points (128, 228) and (236, 79).
; PLAN: r0=128(x1), r1=228(y1), r2=236(x2), r3=79(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 228
LDI r2, 236
LDI r3, 79
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
