; DESCRIPTION: Composite: . Then Draws a red line from (163, 230) to (199, 139). Then Draws a white rectangle at (116, 128) with width 31 and height 32.
; PLAN: r0=163(x1), r1=230(y1), r2=199(x2), r3=139(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=116(x), r1=128(y), r2=31(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red line from (163, 230) to (199, 139).
; PLAN: r0=163(x1), r1=230(y1), r2=199(x2), r3=139(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 230
LDI r2, 199
LDI r3, 139
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a white rectangle at (116, 128) with width 31 and height 32.
; PLAN: r0=116(x), r1=128(y), r2=31(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 128
LDI r2, 31
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
