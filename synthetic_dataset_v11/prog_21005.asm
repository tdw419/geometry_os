; DESCRIPTION: Composite: . Then Places a black 103x116 rectangle at position (140, 75). Then Places a red line segment connecting (181, 137) to (188, 95).
; PLAN: r0=140(x), r1=75(y), r2=103(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=181(x1), r1=137(y1), r2=188(x2), r3=95(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black 103x116 rectangle at position (140, 75).
; PLAN: r0=140(x), r1=75(y), r2=103(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 75
LDI r2, 103
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red line segment connecting (181, 137) to (188, 95).
; PLAN: r0=181(x1), r1=137(y1), r2=188(x2), r3=95(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 137
LDI r2, 188
LDI r3, 95
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
