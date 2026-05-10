; DESCRIPTION: Composite: Places a magenta 20x100 rectangle at position (204, 85) then Renders a blue line between points (262, 205) and (270, 241).
; PLAN: r0=204(x), r1=85(y), r2=20(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=262(x1), r6=205(y1), r7=270(x2), r8=241(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 204
LDI r1, 85
LDI r2, 20
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 262
LDI r6, 205
LDI r7, 270
LDI r8, 241
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
