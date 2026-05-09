; DESCRIPTION: Composite: Renders a green line between points (387, 26) and (296, 195) then Places a orange 90x90 rectangle at position (20, 109) then Sets a single blue pixel at (397, 242).
; PLAN: r0=387(x1), r1=26(y1), r2=296(x2), r3=195(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=20(x), r6=109(y), r7=90(width), r8=90(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=397(x), r11=242(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 387
LDI r1, 26
LDI r2, 296
LDI r3, 195
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 20
LDI r6, 109
LDI r7, 90
LDI r8, 90
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 397
LDI r11, 242
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
