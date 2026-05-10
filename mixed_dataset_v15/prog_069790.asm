; DESCRIPTION: Composite: Draws a purple line from (182, 151) to (466, 40) then Places a orange 82x65 rectangle at position (343, 23).
; PLAN: r0=182(x1), r1=151(y1), r2=466(x2), r3=40(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=343(x), r6=23(y), r7=82(width), r8=65(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 182
LDI r1, 151
LDI r2, 466
LDI r3, 40
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 343
LDI r6, 23
LDI r7, 82
LDI r8, 65
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
