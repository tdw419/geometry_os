; DESCRIPTION: Composite: Renders a yellow disk with center (144, 221) and radius 33 then Places a cyan dot at position (368, 190) then Draws a green rectangle at (434, 120) with width 65 and height 26.
; PLAN: r0=144(x), r1=221(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=368(x), r6=190(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=434(x), r11=120(y), r12=65(width), r13=26(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 144
LDI r1, 221
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 368
LDI r6, 190
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 434
LDI r11, 120
LDI r12, 65
LDI r13, 26
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
