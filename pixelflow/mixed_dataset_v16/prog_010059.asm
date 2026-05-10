; DESCRIPTION: Composite: Places a cyan 109x50 rectangle at position (24, 73) then Creates a green circular shape at (410, 90) with radius 63 then Places a blue line segment connecting (337, 137) to (398, 169).
; PLAN: r0=24(x), r1=73(y), r2=109(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=410(x), r6=90(y), r7=63(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=337(x1), r11=137(y1), r12=398(x2), r13=169(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 24
LDI r1, 73
LDI r2, 109
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 410
LDI r6, 90
LDI r7, 63
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 337
LDI r11, 137
LDI r12, 398
LDI r13, 169
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
