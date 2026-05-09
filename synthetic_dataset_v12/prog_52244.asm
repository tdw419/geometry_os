; DESCRIPTION: Composite: Sets a single purple pixel at (182, 220) then Draws a cyan circle centered at (151, 95) with radius 76 then Renders a red box of size 34x106 starting at (431, 42).
; PLAN: r0=182(x), r1=220(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=151(x), r6=95(y), r7=76(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=431(x), r11=42(y), r12=34(width), r13=106(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 182
LDI r1, 220
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 151
LDI r6, 95
LDI r7, 76
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 431
LDI r11, 42
LDI r12, 34
LDI r13, 106
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
