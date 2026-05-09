; DESCRIPTION: Composite: Draws a blue line from (225, 165) to (188, 47) then Places a blue 36x78 rectangle at position (279, 87).
; PLAN: r0=225(x1), r1=165(y1), r2=188(x2), r3=47(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=279(x), r6=87(y), r7=36(width), r8=78(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 225
LDI r1, 165
LDI r2, 188
LDI r3, 47
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 279
LDI r6, 87
LDI r7, 36
LDI r8, 78
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
