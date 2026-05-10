; DESCRIPTION: Composite: Draws a yellow rectangle at (365, 120) with width 92 and height 105 then Places a magenta line segment connecting (18, 86) to (191, 57).
; PLAN: r0=365(x), r1=120(y), r2=92(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=18(x1), r6=86(y1), r7=191(x2), r8=57(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 365
LDI r1, 120
LDI r2, 92
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 18
LDI r6, 86
LDI r7, 191
LDI r8, 57
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
