; DESCRIPTION: Composite: Places a magenta 19x10 rectangle at position (26, 104) then Renders a purple disk with center (110, 35) and radius 16 then Draws a white line from (503, 16) to (34, 120).
; PLAN: r0=26(x), r1=104(y), r2=19(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=110(x), r6=35(y), r7=16(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=503(x1), r11=16(y1), r12=34(x2), r13=120(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 26
LDI r1, 104
LDI r2, 19
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 110
LDI r6, 35
LDI r7, 16
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 503
LDI r11, 16
LDI r12, 34
LDI r13, 120
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
