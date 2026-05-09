; DESCRIPTION: Composite: Places a black 87x37 rectangle at position (101, 206) then Draws a blue line from (394, 34) to (107, 53).
; PLAN: r0=101(x), r1=206(y), r2=87(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=394(x1), r6=34(y1), r7=107(x2), r8=53(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 101
LDI r1, 206
LDI r2, 87
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 394
LDI r6, 34
LDI r7, 107
LDI r8, 53
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
