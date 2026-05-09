; DESCRIPTION: Composite: Places a cyan line segment connecting (332, 54) to (417, 168) then Draws a purple rectangle at (221, 123) with width 47 and height 28.
; PLAN: r0=332(x1), r1=54(y1), r2=417(x2), r3=168(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=221(x), r6=123(y), r7=47(width), r8=28(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 332
LDI r1, 54
LDI r2, 417
LDI r3, 168
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 221
LDI r6, 123
LDI r7, 47
LDI r8, 28
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
