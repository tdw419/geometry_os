; DESCRIPTION: Composite: Renders a red disk with center (338, 138) and radius 74 then Places a blue 41x85 rectangle at position (246, 96).
; PLAN: r0=338(x), r1=138(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=246(x), r6=96(y), r7=41(width), r8=85(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 338
LDI r1, 138
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 246
LDI r6, 96
LDI r7, 41
LDI r8, 85
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
