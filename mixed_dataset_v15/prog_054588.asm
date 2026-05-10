; DESCRIPTION: Composite: Places a orange 103x30 rectangle at position (137, 83) then Places a white line segment connecting (299, 1) to (156, 184).
; PLAN: r0=137(x), r1=83(y), r2=103(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=299(x1), r6=1(y1), r7=156(x2), r8=184(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 137
LDI r1, 83
LDI r2, 103
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 1
LDI r7, 156
LDI r8, 184
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
