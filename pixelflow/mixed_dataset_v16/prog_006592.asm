; DESCRIPTION: Composite: Places a white line segment connecting (212, 166) to (105, 255) then Places a green dot at position (74, 85) then Places a orange 21x43 rectangle at position (413, 177).
; PLAN: r0=212(x1), r1=166(y1), r2=105(x2), r3=255(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=74(x), r6=85(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=413(x), r11=177(y), r12=21(width), r13=43(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 212
LDI r1, 166
LDI r2, 105
LDI r3, 255
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 74
LDI r6, 85
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 413
LDI r11, 177
LDI r12, 21
LDI r13, 43
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
