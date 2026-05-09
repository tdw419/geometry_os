; DESCRIPTION: Composite: Places a white dot at position (183, 132) then Renders a purple box of size 19x54 starting at (26, 69).
; PLAN: r0=183(x), r1=132(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=26(x), r6=69(y), r7=19(width), r8=54(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 183
LDI r1, 132
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 26
LDI r6, 69
LDI r7, 19
LDI r8, 54
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
