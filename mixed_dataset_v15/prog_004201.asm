; DESCRIPTION: Composite: Renders a purple box of size 53x36 starting at (67, 93) then Draws a orange line from (333, 249) to (245, 0) then Places a yellow dot at position (381, 7).
; PLAN: r0=67(x), r1=93(y), r2=53(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=333(x1), r6=249(y1), r7=245(x2), r8=0(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=381(x), r11=7(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 67
LDI r1, 93
LDI r2, 53
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 333
LDI r6, 249
LDI r7, 245
LDI r8, 0
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 381
LDI r11, 7
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
