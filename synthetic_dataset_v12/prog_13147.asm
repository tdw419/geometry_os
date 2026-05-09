; DESCRIPTION: Composite: Places a blue 73x92 rectangle at position (247, 78) then Renders a green line between points (109, 21) and (49, 5).
; PLAN: r0=247(x), r1=78(y), r2=73(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=109(x1), r6=21(y1), r7=49(x2), r8=5(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 247
LDI r1, 78
LDI r2, 73
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 109
LDI r6, 21
LDI r7, 49
LDI r8, 5
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
