; DESCRIPTION: Composite: Creates a purple circular shape at (348, 132) with radius 68 then Places a yellow line segment connecting (125, 61) to (127, 13) then Renders a magenta box of size 120x52 starting at (196, 46).
; PLAN: r0=348(x), r1=132(y), r2=68(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=125(x1), r6=61(y1), r7=127(x2), r8=13(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=196(x), r11=46(y), r12=120(width), r13=52(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 348
LDI r1, 132
LDI r2, 68
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 125
LDI r6, 61
LDI r7, 127
LDI r8, 13
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 196
LDI r11, 46
LDI r12, 120
LDI r13, 52
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
