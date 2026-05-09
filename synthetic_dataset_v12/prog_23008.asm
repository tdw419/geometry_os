; DESCRIPTION: Composite: Places a green dot at position (381, 162) then Places a orange circle of radius 67 at center (191, 69).
; PLAN: r0=381(x), r1=162(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=191(x), r6=69(y), r7=67(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 381
LDI r1, 162
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 191
LDI r6, 69
LDI r7, 67
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
