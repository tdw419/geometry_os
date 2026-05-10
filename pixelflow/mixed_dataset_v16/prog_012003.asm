; DESCRIPTION: Composite: Renders a magenta box of size 85x96 starting at (259, 119) then Sets a single yellow pixel at (152, 196).
; PLAN: r0=259(x), r1=119(y), r2=85(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=152(x), r6=196(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 259
LDI r1, 119
LDI r2, 85
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 152
LDI r6, 196
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
