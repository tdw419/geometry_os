; DESCRIPTION: Composite: Renders a blue line between points (242, 254) and (337, 210) then Draws a orange rectangle at (323, 82) with width 83 and height 94.
; PLAN: r0=242(x1), r1=254(y1), r2=337(x2), r3=210(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=323(x), r6=82(y), r7=83(width), r8=94(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 242
LDI r1, 254
LDI r2, 337
LDI r3, 210
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 323
LDI r6, 82
LDI r7, 83
LDI r8, 94
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
