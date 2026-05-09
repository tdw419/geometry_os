; DESCRIPTION: Composite: Renders a blue line between points (68, 237) and (354, 74) then Places a green 49x29 rectangle at position (463, 148).
; PLAN: r0=68(x1), r1=237(y1), r2=354(x2), r3=74(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=463(x), r6=148(y), r7=49(width), r8=29(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 68
LDI r1, 237
LDI r2, 354
LDI r3, 74
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 463
LDI r6, 148
LDI r7, 49
LDI r8, 29
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
