; DESCRIPTION: Composite: Places a blue line segment connecting (282, 192) to (6, 75) then Places a purple 82x71 rectangle at position (116, 33).
; PLAN: r0=282(x1), r1=192(y1), r2=6(x2), r3=75(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=116(x), r6=33(y), r7=82(width), r8=71(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 282
LDI r1, 192
LDI r2, 6
LDI r3, 75
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 116
LDI r6, 33
LDI r7, 82
LDI r8, 71
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
