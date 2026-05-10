; DESCRIPTION: Composite: Places a magenta 14x28 rectangle at position (350, 3) then Draws a white line from (330, 214) to (93, 68).
; PLAN: r0=350(x), r1=3(y), r2=14(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=330(x1), r6=214(y1), r7=93(x2), r8=68(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 350
LDI r1, 3
LDI r2, 14
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 330
LDI r6, 214
LDI r7, 93
LDI r8, 68
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
