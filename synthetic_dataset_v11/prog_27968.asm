; DESCRIPTION: Composite: . Then Draws a cyan rectangle at (157, 30) with width 83 and height 12. Then Places a yellow line segment connecting (108, 81) to (143, 176).
; PLAN: r0=157(x), r1=30(y), r2=83(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=108(x1), r1=81(y1), r2=143(x2), r3=176(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan rectangle at (157, 30) with width 83 and height 12.
; PLAN: r0=157(x), r1=30(y), r2=83(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 30
LDI r2, 83
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow line segment connecting (108, 81) to (143, 176).
; PLAN: r0=108(x1), r1=81(y1), r2=143(x2), r3=176(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 81
LDI r2, 143
LDI r3, 176
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
