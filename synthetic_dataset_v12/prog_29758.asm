; DESCRIPTION: Composite: Creates a cyan circular shape at (58, 208) with radius 42 then Sets a single green pixel at (120, 98) then Renders a white box of size 30x40 starting at (432, 77).
; PLAN: r0=58(x), r1=208(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=120(x), r6=98(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=432(x), r11=77(y), r12=30(width), r13=40(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 58
LDI r1, 208
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 120
LDI r6, 98
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 432
LDI r11, 77
LDI r12, 30
LDI r13, 40
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
