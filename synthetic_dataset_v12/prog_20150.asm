; DESCRIPTION: Composite: Places a blue 24x50 rectangle at position (218, 15) then Places a purple line segment connecting (1, 13) to (366, 14).
; PLAN: r0=218(x), r1=15(y), r2=24(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=1(x1), r6=13(y1), r7=366(x2), r8=14(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 218
LDI r1, 15
LDI r2, 24
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 1
LDI r6, 13
LDI r7, 366
LDI r8, 14
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
