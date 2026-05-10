; DESCRIPTION: Composite: Places a orange 31x52 rectangle at position (298, 179) then Draws a magenta line from (35, 8) to (205, 26).
; PLAN: r0=298(x), r1=179(y), r2=31(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=35(x1), r6=8(y1), r7=205(x2), r8=26(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 298
LDI r1, 179
LDI r2, 31
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 35
LDI r6, 8
LDI r7, 205
LDI r8, 26
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
