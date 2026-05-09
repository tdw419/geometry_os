; DESCRIPTION: Composite: Draws a black line from (215, 62) to (455, 160) then Sets a single magenta pixel at (62, 243) then Renders a orange box of size 55x65 starting at (92, 81).
; PLAN: r0=215(x1), r1=62(y1), r2=455(x2), r3=160(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=62(x), r6=243(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=92(x), r11=81(y), r12=55(width), r13=65(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 215
LDI r1, 62
LDI r2, 455
LDI r3, 160
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 62
LDI r6, 243
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 92
LDI r11, 81
LDI r12, 55
LDI r13, 65
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
