; DESCRIPTION: Composite: Places a black dot at position (5, 86) then Renders a purple box of size 65x18 starting at (118, 85).
; PLAN: r0=5(x), r1=86(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=118(x), r6=85(y), r7=65(width), r8=18(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 5
LDI r1, 86
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 118
LDI r6, 85
LDI r7, 65
LDI r8, 18
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
