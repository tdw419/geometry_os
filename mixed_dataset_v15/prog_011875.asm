; DESCRIPTION: Composite: Places a white dot at position (161, 17) then Renders a blue box of size 111x85 starting at (128, 14).
; PLAN: r0=161(x), r1=17(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=128(x), r6=14(y), r7=111(width), r8=85(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 161
LDI r1, 17
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 128
LDI r6, 14
LDI r7, 111
LDI r8, 85
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
