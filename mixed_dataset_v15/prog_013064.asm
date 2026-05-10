; DESCRIPTION: Composite: Places a black line segment connecting (363, 128) to (62, 91) then Places a yellow 51x42 rectangle at position (283, 111) then Renders a cyan disk with center (400, 197) and radius 53.
; PLAN: r0=363(x1), r1=128(y1), r2=62(x2), r3=91(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=283(x), r6=111(y), r7=51(width), r8=42(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=400(x), r11=197(y), r12=53(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 363
LDI r1, 128
LDI r2, 62
LDI r3, 91
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 283
LDI r6, 111
LDI r7, 51
LDI r8, 42
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 400
LDI r11, 197
LDI r12, 53
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
