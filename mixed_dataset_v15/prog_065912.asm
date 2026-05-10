; DESCRIPTION: Composite: Sets a single blue pixel at (254, 181) then Renders a blue box of size 37x66 starting at (203, 99).
; PLAN: r0=254(x), r1=181(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=203(x), r6=99(y), r7=37(width), r8=66(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 254
LDI r1, 181
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 203
LDI r6, 99
LDI r7, 37
LDI r8, 66
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
