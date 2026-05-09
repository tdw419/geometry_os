; DESCRIPTION: Composite: Renders a black box of size 33x98 starting at (330, 49) then Draws a red line from (337, 89) to (372, 3) then Places a black circle of radius 64 at center (297, 168).
; PLAN: r0=330(x), r1=49(y), r2=33(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=337(x1), r6=89(y1), r7=372(x2), r8=3(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=297(x), r11=168(y), r12=64(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 330
LDI r1, 49
LDI r2, 33
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 337
LDI r6, 89
LDI r7, 372
LDI r8, 3
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 297
LDI r11, 168
LDI r12, 64
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
