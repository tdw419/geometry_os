; DESCRIPTION: Composite: Renders a magenta box of size 25x15 starting at (73, 157) then Draws a cyan circle centered at (470, 161) with radius 28 then Sets a single orange pixel at (16, 224).
; PLAN: r0=73(x), r1=157(y), r2=25(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=470(x), r6=161(y), r7=28(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=16(x), r11=224(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 73
LDI r1, 157
LDI r2, 25
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 470
LDI r6, 161
LDI r7, 28
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 16
LDI r11, 224
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
