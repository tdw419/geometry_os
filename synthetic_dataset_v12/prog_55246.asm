; DESCRIPTION: Composite: Creates a red circular shape at (231, 96) with radius 66 then Draws a yellow line from (105, 57) to (445, 180) then Places a magenta 53x90 rectangle at position (87, 114).
; PLAN: r0=231(x), r1=96(y), r2=66(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=105(x1), r6=57(y1), r7=445(x2), r8=180(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=87(x), r11=114(y), r12=53(width), r13=90(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 231
LDI r1, 96
LDI r2, 66
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 105
LDI r6, 57
LDI r7, 445
LDI r8, 180
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 87
LDI r11, 114
LDI r12, 53
LDI r13, 90
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
