; DESCRIPTION: Composite: Places a magenta 35x20 rectangle at position (433, 0) then Sets a single orange pixel at (434, 222) then Renders a yellow line between points (485, 220) and (135, 113).
; PLAN: r0=433(x), r1=0(y), r2=35(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=434(x), r6=222(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=485(x1), r11=220(y1), r12=135(x2), r13=113(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 433
LDI r1, 0
LDI r2, 35
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 434
LDI r6, 222
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 485
LDI r11, 220
LDI r12, 135
LDI r13, 113
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
