; DESCRIPTION: Composite: . Then Draws a white rectangle at (24, 49) with width 45 and height 118. Then Draws a white line from (168, 248) to (36, 51).
; PLAN: r0=24(x), r1=49(y), r2=45(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=168(x1), r1=248(y1), r2=36(x2), r3=51(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a white rectangle at (24, 49) with width 45 and height 118.
; PLAN: r0=24(x), r1=49(y), r2=45(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 49
LDI r2, 45
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a white line from (168, 248) to (36, 51).
; PLAN: r0=168(x1), r1=248(y1), r2=36(x2), r3=51(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 248
LDI r2, 36
LDI r3, 51
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
