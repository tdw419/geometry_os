; DESCRIPTION: Composite: Renders a red disk with center (344, 102) and radius 46 then Sets a single cyan pixel at (191, 216) then Places a black 120x111 rectangle at position (12, 139).
; PLAN: r0=344(x), r1=102(y), r2=46(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=191(x), r6=216(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=12(x), r11=139(y), r12=120(width), r13=111(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 344
LDI r1, 102
LDI r2, 46
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 191
LDI r6, 216
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 12
LDI r11, 139
LDI r12, 120
LDI r13, 111
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
