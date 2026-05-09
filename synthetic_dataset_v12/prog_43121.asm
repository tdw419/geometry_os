; DESCRIPTION: Composite: Places a magenta 73x105 rectangle at position (31, 4) then Renders a red line between points (350, 206) and (124, 208).
; PLAN: r0=31(x), r1=4(y), r2=73(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=350(x1), r6=206(y1), r7=124(x2), r8=208(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 31
LDI r1, 4
LDI r2, 73
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 350
LDI r6, 206
LDI r7, 124
LDI r8, 208
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
