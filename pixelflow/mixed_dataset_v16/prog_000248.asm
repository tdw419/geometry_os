; DESCRIPTION: Composite: Places a yellow 67x106 rectangle at position (109, 128) then Renders a yellow disk with center (383, 103) and radius 57 then Places a cyan dot at position (270, 140).
; PLAN: r0=109(x), r1=128(y), r2=67(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=383(x), r6=103(y), r7=57(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=270(x), r11=140(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 109
LDI r1, 128
LDI r2, 67
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 383
LDI r6, 103
LDI r7, 57
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 270
LDI r11, 140
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
