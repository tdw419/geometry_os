; DESCRIPTION: Composite: Renders a cyan box of size 14x45 starting at (82, 109) then Creates a green circular shape at (377, 126) with radius 50.
; PLAN: r0=82(x), r1=109(y), r2=14(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=377(x), r6=126(y), r7=50(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 82
LDI r1, 109
LDI r2, 14
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 377
LDI r6, 126
LDI r7, 50
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
