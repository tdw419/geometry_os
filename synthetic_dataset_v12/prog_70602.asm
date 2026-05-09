; DESCRIPTION: Composite: Renders a purple disk with center (52, 176) and radius 31 then Sets a single cyan pixel at (373, 242) then Renders a orange box of size 68x50 starting at (379, 63).
; PLAN: r0=52(x), r1=176(y), r2=31(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=373(x), r6=242(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=379(x), r11=63(y), r12=68(width), r13=50(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 52
LDI r1, 176
LDI r2, 31
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 373
LDI r6, 242
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 379
LDI r11, 63
LDI r12, 68
LDI r13, 50
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
