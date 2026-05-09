; DESCRIPTION: Composite: Renders a yellow box of size 53x51 starting at (146, 179) then Draws a cyan line from (287, 150) to (372, 120) then Draws a red circle centered at (165, 107) with radius 44.
; PLAN: r0=146(x), r1=179(y), r2=53(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=287(x1), r6=150(y1), r7=372(x2), r8=120(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=165(x), r11=107(y), r12=44(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 146
LDI r1, 179
LDI r2, 53
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 287
LDI r6, 150
LDI r7, 372
LDI r8, 120
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 165
LDI r11, 107
LDI r12, 44
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
