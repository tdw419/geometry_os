; DESCRIPTION: Composite: Draws a yellow line from (145, 168) to (10, 247) then Places a orange 98x105 rectangle at position (151, 78).
; PLAN: r0=145(x1), r1=168(y1), r2=10(x2), r3=247(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=151(x), r6=78(y), r7=98(width), r8=105(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 145
LDI r1, 168
LDI r2, 10
LDI r3, 247
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 78
LDI r7, 98
LDI r8, 105
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
