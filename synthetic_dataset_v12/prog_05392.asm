; DESCRIPTION: Composite: Places a black line segment connecting (434, 111) to (99, 152) then Renders a purple box of size 96x116 starting at (326, 135) then Sets a single magenta pixel at (150, 91).
; PLAN: r0=434(x1), r1=111(y1), r2=99(x2), r3=152(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=326(x), r6=135(y), r7=96(width), r8=116(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=150(x), r11=91(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 434
LDI r1, 111
LDI r2, 99
LDI r3, 152
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 326
LDI r6, 135
LDI r7, 96
LDI r8, 116
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 150
LDI r11, 91
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
