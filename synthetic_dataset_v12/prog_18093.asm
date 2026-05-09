; DESCRIPTION: Composite: Places a blue line segment connecting (105, 157) to (417, 238) then Places a blue 109x16 rectangle at position (385, 67).
; PLAN: r0=105(x1), r1=157(y1), r2=417(x2), r3=238(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=385(x), r6=67(y), r7=109(width), r8=16(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 105
LDI r1, 157
LDI r2, 417
LDI r3, 238
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 385
LDI r6, 67
LDI r7, 109
LDI r8, 16
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
