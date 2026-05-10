; DESCRIPTION: Composite: Creates a purple circular shape at (97, 133) with radius 77 then Places a blue 120x66 rectangle at position (132, 126) then Places a black line segment connecting (91, 98) to (97, 213).
; PLAN: r0=97(x), r1=133(y), r2=77(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=132(x), r6=126(y), r7=120(width), r8=66(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=91(x1), r11=98(y1), r12=97(x2), r13=213(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 97
LDI r1, 133
LDI r2, 77
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 132
LDI r6, 126
LDI r7, 120
LDI r8, 66
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 91
LDI r11, 98
LDI r12, 97
LDI r13, 213
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
