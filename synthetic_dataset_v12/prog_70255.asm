; DESCRIPTION: Composite: Creates a orange rectangular region at (473, 6) spanning 30 by 119 pixels then Places a blue dot at position (206, 228) then Places a yellow line segment connecting (14, 210) to (152, 111).
; PLAN: r0=473(x), r1=6(y), r2=30(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=206(x), r6=228(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=14(x1), r11=210(y1), r12=152(x2), r13=111(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 473
LDI r1, 6
LDI r2, 30
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 206
LDI r6, 228
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 14
LDI r11, 210
LDI r12, 152
LDI r13, 111
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
