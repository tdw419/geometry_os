; DESCRIPTION: Composite: . Then Draws a green rectangle at (90, 7) with width 97 and height 33. Then Draws a yellow line from (25, 8) to (182, 45).
; PLAN: r0=90(x), r1=7(y), r2=97(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=25(x1), r1=8(y1), r2=182(x2), r3=45(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a green rectangle at (90, 7) with width 97 and height 33.
; PLAN: r0=90(x), r1=7(y), r2=97(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 7
LDI r2, 97
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow line from (25, 8) to (182, 45).
; PLAN: r0=25(x1), r1=8(y1), r2=182(x2), r3=45(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 8
LDI r2, 182
LDI r3, 45
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
