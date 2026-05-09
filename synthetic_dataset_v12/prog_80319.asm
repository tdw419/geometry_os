; DESCRIPTION: Composite: Places a purple line segment connecting (79, 39) to (375, 90) then Places a white dot at position (15, 87) then Renders a red box of size 75x59 starting at (434, 197).
; PLAN: r0=79(x1), r1=39(y1), r2=375(x2), r3=90(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=15(x), r6=87(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=434(x), r11=197(y), r12=75(width), r13=59(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 79
LDI r1, 39
LDI r2, 375
LDI r3, 90
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 15
LDI r6, 87
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 434
LDI r11, 197
LDI r12, 75
LDI r13, 59
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
