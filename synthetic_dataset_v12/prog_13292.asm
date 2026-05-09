; DESCRIPTION: Composite: Places a cyan 92x83 rectangle at position (6, 16) then Renders a blue line between points (222, 204) and (337, 137) then Creates a cyan circular shape at (30, 162) with radius 24.
; PLAN: r0=6(x), r1=16(y), r2=92(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=222(x1), r6=204(y1), r7=337(x2), r8=137(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=30(x), r11=162(y), r12=24(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 6
LDI r1, 16
LDI r2, 92
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 222
LDI r6, 204
LDI r7, 337
LDI r8, 137
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 30
LDI r11, 162
LDI r12, 24
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
