; DESCRIPTION: Composite: Renders a purple line between points (42, 110) and (324, 173) then Draws a cyan rectangle at (274, 103) with width 16 and height 37.
; PLAN: r0=42(x1), r1=110(y1), r2=324(x2), r3=173(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=274(x), r6=103(y), r7=16(width), r8=37(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 42
LDI r1, 110
LDI r2, 324
LDI r3, 173
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 274
LDI r6, 103
LDI r7, 16
LDI r8, 37
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
