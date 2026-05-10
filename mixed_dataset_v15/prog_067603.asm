; DESCRIPTION: Composite: Creates a cyan circular shape at (29, 231) with radius 24 then Renders a green box of size 96x28 starting at (55, 45).
; PLAN: r0=29(x), r1=231(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=55(x), r6=45(y), r7=96(width), r8=28(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 29
LDI r1, 231
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 55
LDI r6, 45
LDI r7, 96
LDI r8, 28
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
