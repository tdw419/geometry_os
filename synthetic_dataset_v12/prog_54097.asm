; DESCRIPTION: Composite: Creates a red rectangular region at (235, 144) spanning 24 by 48 pixels then Renders a red line between points (504, 103) and (394, 71).
; PLAN: r0=235(x), r1=144(y), r2=24(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=504(x1), r6=103(y1), r7=394(x2), r8=71(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 235
LDI r1, 144
LDI r2, 24
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 504
LDI r6, 103
LDI r7, 394
LDI r8, 71
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
