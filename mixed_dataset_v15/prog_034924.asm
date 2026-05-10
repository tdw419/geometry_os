; DESCRIPTION: Composite: Places a blue 99x45 rectangle at position (177, 17) then Places a yellow circle of radius 59 at center (374, 82).
; PLAN: r0=177(x), r1=17(y), r2=99(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=374(x), r6=82(y), r7=59(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 177
LDI r1, 17
LDI r2, 99
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 374
LDI r6, 82
LDI r7, 59
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
