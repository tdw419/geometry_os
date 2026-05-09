; DESCRIPTION: Composite: Draws a cyan line from (44, 0) to (451, 118) then Places a red 32x88 rectangle at position (329, 108).
; PLAN: r0=44(x1), r1=0(y1), r2=451(x2), r3=118(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=329(x), r6=108(y), r7=32(width), r8=88(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 44
LDI r1, 0
LDI r2, 451
LDI r3, 118
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 329
LDI r6, 108
LDI r7, 32
LDI r8, 88
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
