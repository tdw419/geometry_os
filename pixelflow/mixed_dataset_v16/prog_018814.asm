; DESCRIPTION: Composite: Places a magenta 56x38 rectangle at position (8, 212) then Sets a single green pixel at (16, 227) then Renders a green line between points (191, 98) and (198, 38).
; PLAN: r0=8(x), r1=212(y), r2=56(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=16(x), r6=227(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=191(x1), r11=98(y1), r12=198(x2), r13=38(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 8
LDI r1, 212
LDI r2, 56
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 16
LDI r6, 227
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 191
LDI r11, 98
LDI r12, 198
LDI r13, 38
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
