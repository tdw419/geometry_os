; DESCRIPTION: Composite: Places a white circle of radius 30 at center (226, 203) then Renders a purple box of size 46x47 starting at (464, 70) then Draws a black line from (126, 42) to (363, 6).
; PLAN: r0=226(x), r1=203(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=464(x), r6=70(y), r7=46(width), r8=47(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=126(x1), r11=42(y1), r12=363(x2), r13=6(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 226
LDI r1, 203
LDI r2, 30
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 464
LDI r6, 70
LDI r7, 46
LDI r8, 47
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 126
LDI r11, 42
LDI r12, 363
LDI r13, 6
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
