; DESCRIPTION: Composite: Places a cyan 19x47 rectangle at position (102, 80) then Places a red line segment connecting (116, 35) to (288, 176).
; PLAN: r0=102(x), r1=80(y), r2=19(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=116(x1), r6=35(y1), r7=288(x2), r8=176(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 102
LDI r1, 80
LDI r2, 19
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 116
LDI r6, 35
LDI r7, 288
LDI r8, 176
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
