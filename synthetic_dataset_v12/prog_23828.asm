; DESCRIPTION: Composite: Renders a red box of size 112x69 starting at (60, 178) then Places a white dot at position (10, 216) then Places a white line segment connecting (459, 213) to (134, 25).
; PLAN: r0=60(x), r1=178(y), r2=112(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=10(x), r6=216(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=459(x1), r11=213(y1), r12=134(x2), r13=25(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 60
LDI r1, 178
LDI r2, 112
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 10
LDI r6, 216
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 459
LDI r11, 213
LDI r12, 134
LDI r13, 25
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
