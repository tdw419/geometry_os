; DESCRIPTION: Composite: Places a yellow dot at position (103, 228) then Draws a purple line from (477, 90) to (144, 166) then Renders a orange box of size 74x78 starting at (405, 76).
; PLAN: r0=103(x), r1=228(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=477(x1), r6=90(y1), r7=144(x2), r8=166(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=405(x), r11=76(y), r12=74(width), r13=78(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 103
LDI r1, 228
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 477
LDI r6, 90
LDI r7, 144
LDI r8, 166
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 405
LDI r11, 76
LDI r12, 74
LDI r13, 78
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
