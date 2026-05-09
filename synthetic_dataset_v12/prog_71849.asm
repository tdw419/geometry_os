; DESCRIPTION: Composite: Renders a purple box of size 10x99 starting at (64, 23) then Places a yellow dot at position (403, 20) then Draws a white line from (104, 191) to (251, 148).
; PLAN: r0=64(x), r1=23(y), r2=10(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=403(x), r6=20(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=104(x1), r11=191(y1), r12=251(x2), r13=148(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 64
LDI r1, 23
LDI r2, 10
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 403
LDI r6, 20
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 104
LDI r11, 191
LDI r12, 251
LDI r13, 148
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
