; DESCRIPTION: Composite: Creates a green rectangular region at (241, 107) spanning 117 by 42 pixels then Draws a black line from (488, 96) to (114, 143).
; PLAN: r0=241(x), r1=107(y), r2=117(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=488(x1), r6=96(y1), r7=114(x2), r8=143(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 241
LDI r1, 107
LDI r2, 117
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 488
LDI r6, 96
LDI r7, 114
LDI r8, 143
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
