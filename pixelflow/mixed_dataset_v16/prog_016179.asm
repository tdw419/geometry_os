; DESCRIPTION: Composite: Places a yellow dot at position (93, 138) then Renders a blue box of size 33x12 starting at (296, 173).
; PLAN: r0=93(x), r1=138(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=296(x), r6=173(y), r7=33(width), r8=12(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 93
LDI r1, 138
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 296
LDI r6, 173
LDI r7, 33
LDI r8, 12
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
