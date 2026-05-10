; DESCRIPTION: Composite: Renders a orange box of size 88x52 starting at (152, 36) then Sets a single blue pixel at (467, 72).
; PLAN: r0=152(x), r1=36(y), r2=88(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=467(x), r6=72(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 152
LDI r1, 36
LDI r2, 88
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 467
LDI r6, 72
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
