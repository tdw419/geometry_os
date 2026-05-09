; DESCRIPTION: Composite: Places a black dot at position (462, 65) then Renders a purple box of size 17x63 starting at (188, 94).
; PLAN: r0=462(x), r1=65(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=188(x), r6=94(y), r7=17(width), r8=63(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 462
LDI r1, 65
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 188
LDI r6, 94
LDI r7, 17
LDI r8, 63
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
