; DESCRIPTION: Composite: . Then Draws a white rectangle at (62, 60) with width 42 and height 99. Then Renders a cyan line between points (36, 252) and (76, 49).
; PLAN: r0=62(x), r1=60(y), r2=42(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=36(x1), r1=252(y1), r2=76(x2), r3=49(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a white rectangle at (62, 60) with width 42 and height 99.
; PLAN: r0=62(x), r1=60(y), r2=42(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 60
LDI r2, 42
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan line between points (36, 252) and (76, 49).
; PLAN: r0=36(x1), r1=252(y1), r2=76(x2), r3=49(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 252
LDI r2, 76
LDI r3, 49
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
