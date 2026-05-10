; DESCRIPTION: Composite: Draws a orange line from (341, 11) to (123, 218) then Places a white 86x73 rectangle at position (330, 85).
; PLAN: r0=341(x1), r1=11(y1), r2=123(x2), r3=218(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=330(x), r6=85(y), r7=86(width), r8=73(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 341
LDI r1, 11
LDI r2, 123
LDI r3, 218
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 330
LDI r6, 85
LDI r7, 86
LDI r8, 73
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
