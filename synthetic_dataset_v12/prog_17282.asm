; DESCRIPTION: Composite: Renders a yellow box of size 44x60 starting at (40, 25) then Places a cyan dot at position (431, 42) then Places a black circle of radius 69 at center (195, 86).
; PLAN: r0=40(x), r1=25(y), r2=44(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=431(x), r6=42(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=195(x), r11=86(y), r12=69(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 40
LDI r1, 25
LDI r2, 44
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 431
LDI r6, 42
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 195
LDI r11, 86
LDI r12, 69
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
