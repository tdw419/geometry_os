; DESCRIPTION: Composite: Places a cyan 106x13 rectangle at position (3, 73) then Renders a magenta line between points (105, 67) and (471, 254).
; PLAN: r0=3(x), r1=73(y), r2=106(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=105(x1), r6=67(y1), r7=471(x2), r8=254(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 3
LDI r1, 73
LDI r2, 106
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 105
LDI r6, 67
LDI r7, 471
LDI r8, 254
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
