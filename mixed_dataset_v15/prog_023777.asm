; DESCRIPTION: Composite: Renders a red box of size 22x68 starting at (19, 124) then Creates a purple circular shape at (326, 193) with radius 42 then Sets a single cyan pixel at (79, 74).
; PLAN: r0=19(x), r1=124(y), r2=22(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=326(x), r6=193(y), r7=42(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=79(x), r11=74(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 19
LDI r1, 124
LDI r2, 22
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 326
LDI r6, 193
LDI r7, 42
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 79
LDI r11, 74
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
