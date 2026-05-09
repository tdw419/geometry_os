; DESCRIPTION: Composite: Draws a green line from (292, 192) to (324, 114) then Places a orange 93x44 rectangle at position (303, 176).
; PLAN: r0=292(x1), r1=192(y1), r2=324(x2), r3=114(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=303(x), r6=176(y), r7=93(width), r8=44(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 292
LDI r1, 192
LDI r2, 324
LDI r3, 114
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 176
LDI r7, 93
LDI r8, 44
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
