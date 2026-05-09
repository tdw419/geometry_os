; DESCRIPTION: Composite: Places a black 30x21 rectangle at position (274, 142) then Draws a blue line from (480, 15) to (73, 101).
; PLAN: r0=274(x), r1=142(y), r2=30(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=480(x1), r6=15(y1), r7=73(x2), r8=101(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 274
LDI r1, 142
LDI r2, 30
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 480
LDI r6, 15
LDI r7, 73
LDI r8, 101
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
