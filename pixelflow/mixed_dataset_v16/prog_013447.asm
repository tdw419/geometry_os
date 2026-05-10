; DESCRIPTION: Composite: Sets a single white pixel at (15, 93) then Renders a yellow box of size 52x120 starting at (420, 66) then Creates a cyan circular shape at (385, 200) with radius 46.
; PLAN: r0=15(x), r1=93(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=420(x), r6=66(y), r7=52(width), r8=120(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=385(x), r11=200(y), r12=46(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 15
LDI r1, 93
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 420
LDI r6, 66
LDI r7, 52
LDI r8, 120
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 385
LDI r11, 200
LDI r12, 46
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
