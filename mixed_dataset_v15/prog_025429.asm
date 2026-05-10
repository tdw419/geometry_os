; DESCRIPTION: Composite: Renders a blue box of size 51x115 starting at (113, 42) then Draws a black line from (32, 222) to (419, 4) then Places a purple dot at position (250, 198).
; PLAN: r0=113(x), r1=42(y), r2=51(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=32(x1), r6=222(y1), r7=419(x2), r8=4(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=250(x), r11=198(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 113
LDI r1, 42
LDI r2, 51
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 32
LDI r6, 222
LDI r7, 419
LDI r8, 4
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 250
LDI r11, 198
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
