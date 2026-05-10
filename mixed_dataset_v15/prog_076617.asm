; DESCRIPTION: Composite: Renders a red box of size 103x98 starting at (154, 20) then Renders a magenta disk with center (180, 181) and radius 38 then Sets a single yellow pixel at (391, 192).
; PLAN: r0=154(x), r1=20(y), r2=103(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=180(x), r6=181(y), r7=38(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=391(x), r11=192(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 154
LDI r1, 20
LDI r2, 103
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 180
LDI r6, 181
LDI r7, 38
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 391
LDI r11, 192
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
