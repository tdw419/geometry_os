; DESCRIPTION: Composite: Renders a green disk with center (272, 182) and radius 15 then Places a magenta 72x85 rectangle at position (215, 102).
; PLAN: r0=272(x), r1=182(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=215(x), r6=102(y), r7=72(width), r8=85(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 272
LDI r1, 182
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 215
LDI r6, 102
LDI r7, 72
LDI r8, 85
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
