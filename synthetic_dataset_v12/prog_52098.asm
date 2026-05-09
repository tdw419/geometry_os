; DESCRIPTION: Composite: Creates a yellow rectangular region at (384, 202) spanning 74 by 32 pixels then Renders a cyan line between points (235, 115) and (190, 248).
; PLAN: r0=384(x), r1=202(y), r2=74(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=235(x1), r6=115(y1), r7=190(x2), r8=248(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 384
LDI r1, 202
LDI r2, 74
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 235
LDI r6, 115
LDI r7, 190
LDI r8, 248
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
