; DESCRIPTION: Composite: Sets a single magenta pixel at (217, 21) then Draws a yellow line from (121, 45) to (352, 32) then Renders a yellow box of size 64x108 starting at (279, 110).
; PLAN: r0=217(x), r1=21(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=121(x1), r6=45(y1), r7=352(x2), r8=32(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=279(x), r11=110(y), r12=64(width), r13=108(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 217
LDI r1, 21
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 121
LDI r6, 45
LDI r7, 352
LDI r8, 32
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 279
LDI r11, 110
LDI r12, 64
LDI r13, 108
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
