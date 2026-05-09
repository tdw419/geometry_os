; DESCRIPTION: Composite: Creates a red circular shape at (114, 210) with radius 42 then Renders a white box of size 52x112 starting at (1, 60) then Sets a single cyan pixel at (269, 188).
; PLAN: r0=114(x), r1=210(y), r2=42(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=1(x), r6=60(y), r7=52(width), r8=112(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=269(x), r11=188(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 114
LDI r1, 210
LDI r2, 42
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 1
LDI r6, 60
LDI r7, 52
LDI r8, 112
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 269
LDI r11, 188
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
