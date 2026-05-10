; DESCRIPTION: Composite: Places a red 53x19 rectangle at position (243, 232) then Draws a cyan line from (486, 212) to (505, 142) then Places a cyan circle of radius 28 at center (100, 42).
; PLAN: r0=243(x), r1=232(y), r2=53(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=486(x1), r6=212(y1), r7=505(x2), r8=142(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=100(x), r11=42(y), r12=28(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 243
LDI r1, 232
LDI r2, 53
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 486
LDI r6, 212
LDI r7, 505
LDI r8, 142
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 100
LDI r11, 42
LDI r12, 28
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
