; DESCRIPTION: Composite: Renders a yellow box of size 25x40 starting at (384, 147) then Places a cyan dot at position (302, 44) then Draws a cyan line from (358, 139) to (351, 247).
; PLAN: r0=384(x), r1=147(y), r2=25(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=302(x), r6=44(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=358(x1), r11=139(y1), r12=351(x2), r13=247(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 384
LDI r1, 147
LDI r2, 25
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 302
LDI r6, 44
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 358
LDI r11, 139
LDI r12, 351
LDI r13, 247
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
