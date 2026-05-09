; DESCRIPTION: Composite: . Then Draws a red rectangle at (22, 71) with width 116 and height 28. Then Renders a yellow line between points (189, 41) and (195, 176).
; PLAN: r0=22(x), r1=71(y), r2=116(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=189(x1), r1=41(y1), r2=195(x2), r3=176(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red rectangle at (22, 71) with width 116 and height 28.
; PLAN: r0=22(x), r1=71(y), r2=116(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 71
LDI r2, 116
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow line between points (189, 41) and (195, 176).
; PLAN: r0=189(x1), r1=41(y1), r2=195(x2), r3=176(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 41
LDI r2, 195
LDI r3, 176
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
