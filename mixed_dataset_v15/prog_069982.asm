; DESCRIPTION: Composite: Renders a cyan line between points (227, 67) and (351, 228) then Renders a purple box of size 67x101 starting at (415, 58).
; PLAN: r0=227(x1), r1=67(y1), r2=351(x2), r3=228(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=415(x), r6=58(y), r7=67(width), r8=101(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 227
LDI r1, 67
LDI r2, 351
LDI r3, 228
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 415
LDI r6, 58
LDI r7, 67
LDI r8, 101
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
