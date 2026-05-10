; DESCRIPTION: Composite: Renders a cyan disk with center (313, 137) and radius 63 then Places a purple 99x14 rectangle at position (33, 199).
; PLAN: r0=313(x), r1=137(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=33(x), r6=199(y), r7=99(width), r8=14(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 313
LDI r1, 137
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 33
LDI r6, 199
LDI r7, 99
LDI r8, 14
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
