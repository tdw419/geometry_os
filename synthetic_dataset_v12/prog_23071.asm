; DESCRIPTION: Composite: Places a orange 71x114 rectangle at position (435, 135) then Draws a yellow line from (477, 205) to (117, 247).
; PLAN: r0=435(x), r1=135(y), r2=71(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=477(x1), r6=205(y1), r7=117(x2), r8=247(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 435
LDI r1, 135
LDI r2, 71
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 477
LDI r6, 205
LDI r7, 117
LDI r8, 247
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
