; DESCRIPTION: Composite: Places a green 29x66 rectangle at position (96, 35) then Places a magenta dot at position (201, 173) then Renders a magenta line between points (103, 172) and (435, 205).
; PLAN: r0=96(x), r1=35(y), r2=29(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=201(x), r6=173(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=103(x1), r11=172(y1), r12=435(x2), r13=205(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 96
LDI r1, 35
LDI r2, 29
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 201
LDI r6, 173
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 103
LDI r11, 172
LDI r12, 435
LDI r13, 205
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
