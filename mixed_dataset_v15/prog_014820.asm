; DESCRIPTION: Composite: Places a green dot at position (43, 43) then Renders a purple box of size 19x72 starting at (168, 62).
; PLAN: r0=43(x), r1=43(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=168(x), r6=62(y), r7=19(width), r8=72(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 43
LDI r1, 43
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 168
LDI r6, 62
LDI r7, 19
LDI r8, 72
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
