; DESCRIPTION: Composite: Renders a red box of size 91x48 starting at (235, 99) then Sets a single yellow pixel at (482, 203).
; PLAN: r0=235(x), r1=99(y), r2=91(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=482(x), r6=203(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 235
LDI r1, 99
LDI r2, 91
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 482
LDI r6, 203
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
