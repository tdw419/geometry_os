; DESCRIPTION: Composite: Renders a blue box of size 17x116 starting at (59, 5) then Sets a single blue pixel at (356, 70).
; PLAN: r0=59(x), r1=5(y), r2=17(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=356(x), r6=70(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 59
LDI r1, 5
LDI r2, 17
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 356
LDI r6, 70
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
