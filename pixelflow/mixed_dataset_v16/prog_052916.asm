; DESCRIPTION: Composite: Sets a single green pixel at (380, 12) then Places a yellow circle of radius 13 at center (349, 112) then Renders a purple box of size 90x59 starting at (281, 34).
; PLAN: r0=380(x), r1=12(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=349(x), r6=112(y), r7=13(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=281(x), r11=34(y), r12=90(width), r13=59(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 380
LDI r1, 12
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 349
LDI r6, 112
LDI r7, 13
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 281
LDI r11, 34
LDI r12, 90
LDI r13, 59
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
