; DESCRIPTION: Composite: Sets a single blue pixel at (455, 70) then Renders a yellow box of size 106x109 starting at (84, 100).
; PLAN: r0=455(x), r1=70(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=84(x), r6=100(y), r7=106(width), r8=109(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 455
LDI r1, 70
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 84
LDI r6, 100
LDI r7, 106
LDI r8, 109
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
