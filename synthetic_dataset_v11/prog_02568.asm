; DESCRIPTION: Composite: . Then Draws a white line from (174, 100) to (14, 8). Then Draws a green rectangle at (178, 109) with width 19 and height 16.
; PLAN: r0=174(x1), r1=100(y1), r2=14(x2), r3=8(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=178(x), r1=109(y), r2=19(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a white line from (174, 100) to (14, 8).
; PLAN: r0=174(x1), r1=100(y1), r2=14(x2), r3=8(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 100
LDI r2, 14
LDI r3, 8
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green rectangle at (178, 109) with width 19 and height 16.
; PLAN: r0=178(x), r1=109(y), r2=19(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 109
LDI r2, 19
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
