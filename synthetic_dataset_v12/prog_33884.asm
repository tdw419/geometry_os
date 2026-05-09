; DESCRIPTION: Composite: Draws a black line from (384, 133) to (425, 69) then Places a green 105x84 rectangle at position (297, 168).
; PLAN: r0=384(x1), r1=133(y1), r2=425(x2), r3=69(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=297(x), r6=168(y), r7=105(width), r8=84(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 384
LDI r1, 133
LDI r2, 425
LDI r3, 69
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 168
LDI r7, 105
LDI r8, 84
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
