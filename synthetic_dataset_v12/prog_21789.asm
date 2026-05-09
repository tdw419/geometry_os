; DESCRIPTION: Composite: Renders a magenta disk with center (135, 112) and radius 11 then Renders a red box of size 66x55 starting at (3, 6) then Sets a single yellow pixel at (209, 118).
; PLAN: r0=135(x), r1=112(y), r2=11(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=3(x), r6=6(y), r7=66(width), r8=55(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=209(x), r11=118(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 135
LDI r1, 112
LDI r2, 11
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 3
LDI r6, 6
LDI r7, 66
LDI r8, 55
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 209
LDI r11, 118
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
