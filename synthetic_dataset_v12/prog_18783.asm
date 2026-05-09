; DESCRIPTION: Composite: Places a cyan line segment connecting (104, 81) to (304, 176) then Renders a orange box of size 32x104 starting at (252, 58).
; PLAN: r0=104(x1), r1=81(y1), r2=304(x2), r3=176(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=252(x), r6=58(y), r7=32(width), r8=104(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 104
LDI r1, 81
LDI r2, 304
LDI r3, 176
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 252
LDI r6, 58
LDI r7, 32
LDI r8, 104
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
