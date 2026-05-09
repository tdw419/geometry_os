; DESCRIPTION: Composite: Renders a blue disk with center (207, 74) and radius 65 then Draws a cyan line from (199, 5) to (206, 190) then Creates a orange rectangular region at (158, 126) spanning 51 by 16 pixels.
; PLAN: r0=207(x), r1=74(y), r2=65(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=199(x1), r6=5(y1), r7=206(x2), r8=190(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=158(x), r11=126(y), r12=51(width), r13=16(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 207
LDI r1, 74
LDI r2, 65
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 199
LDI r6, 5
LDI r7, 206
LDI r8, 190
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 158
LDI r11, 126
LDI r12, 51
LDI r13, 16
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
