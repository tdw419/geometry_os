; DESCRIPTION: Composite: Places a cyan circle of radius 65 at center (101, 78) then Renders a cyan box of size 60x90 starting at (214, 147).
; PLAN: r0=101(x), r1=78(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=214(x), r6=147(y), r7=60(width), r8=90(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 101
LDI r1, 78
LDI r2, 65
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 214
LDI r6, 147
LDI r7, 60
LDI r8, 90
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
