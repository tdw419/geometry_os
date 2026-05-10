; DESCRIPTION: Composite: Places a purple line segment connecting (329, 174) to (349, 255) then Places a yellow 111x67 rectangle at position (163, 57).
; PLAN: r0=329(x1), r1=174(y1), r2=349(x2), r3=255(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=163(x), r6=57(y), r7=111(width), r8=67(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 329
LDI r1, 174
LDI r2, 349
LDI r3, 255
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 163
LDI r6, 57
LDI r7, 111
LDI r8, 67
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
