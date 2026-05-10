; DESCRIPTION: Composite: Renders a purple box of size 13x58 starting at (170, 176) then Places a cyan circle of radius 14 at center (464, 121).
; PLAN: r0=170(x), r1=176(y), r2=13(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=464(x), r6=121(y), r7=14(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 170
LDI r1, 176
LDI r2, 13
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 464
LDI r6, 121
LDI r7, 14
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
