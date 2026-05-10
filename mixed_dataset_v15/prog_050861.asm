; DESCRIPTION: Composite: Renders a magenta box of size 85x32 starting at (314, 123) then Places a orange line segment connecting (151, 143) to (420, 125) then Places a blue dot at position (113, 70).
; PLAN: r0=314(x), r1=123(y), r2=85(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=151(x1), r6=143(y1), r7=420(x2), r8=125(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=113(x), r11=70(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 314
LDI r1, 123
LDI r2, 85
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 143
LDI r7, 420
LDI r8, 125
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 113
LDI r11, 70
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
