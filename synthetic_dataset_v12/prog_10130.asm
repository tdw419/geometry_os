; DESCRIPTION: Composite: Places a magenta 77x107 rectangle at position (429, 97) then Draws a cyan circle centered at (108, 129) with radius 66 then Draws a green line from (435, 46) to (474, 254).
; PLAN: r0=429(x), r1=97(y), r2=77(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=108(x), r6=129(y), r7=66(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=435(x1), r11=46(y1), r12=474(x2), r13=254(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 429
LDI r1, 97
LDI r2, 77
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 108
LDI r6, 129
LDI r7, 66
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 435
LDI r11, 46
LDI r12, 474
LDI r13, 254
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
