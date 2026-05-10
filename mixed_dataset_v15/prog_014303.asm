; DESCRIPTION: Composite: Renders a magenta line between points (120, 248) and (473, 153) then Renders a blue box of size 52x74 starting at (293, 92).
; PLAN: r0=120(x1), r1=248(y1), r2=473(x2), r3=153(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=293(x), r6=92(y), r7=52(width), r8=74(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 120
LDI r1, 248
LDI r2, 473
LDI r3, 153
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 293
LDI r6, 92
LDI r7, 52
LDI r8, 74
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
