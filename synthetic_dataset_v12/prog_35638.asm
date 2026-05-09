; DESCRIPTION: Composite: Draws a black line from (48, 134) to (176, 199) then Places a blue 97x13 rectangle at position (205, 207).
; PLAN: r0=48(x1), r1=134(y1), r2=176(x2), r3=199(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=205(x), r6=207(y), r7=97(width), r8=13(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 48
LDI r1, 134
LDI r2, 176
LDI r3, 199
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 207
LDI r7, 97
LDI r8, 13
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
