; DESCRIPTION: Composite: Renders a blue line between points (265, 81) and (30, 193) then Creates a magenta rectangular region at (376, 72) spanning 49 by 93 pixels.
; PLAN: r0=265(x1), r1=81(y1), r2=30(x2), r3=193(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=376(x), r6=72(y), r7=49(width), r8=93(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 265
LDI r1, 81
LDI r2, 30
LDI r3, 193
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 376
LDI r6, 72
LDI r7, 49
LDI r8, 93
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
