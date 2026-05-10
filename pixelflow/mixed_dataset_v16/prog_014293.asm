; DESCRIPTION: Composite: Renders a cyan disk with center (439, 186) and radius 63 then Places a purple 52x76 rectangle at position (306, 11).
; PLAN: r0=439(x), r1=186(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=306(x), r6=11(y), r7=52(width), r8=76(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 439
LDI r1, 186
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 306
LDI r6, 11
LDI r7, 52
LDI r8, 76
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
