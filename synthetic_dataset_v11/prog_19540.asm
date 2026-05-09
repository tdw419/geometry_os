; DESCRIPTION: Composite: . Then Draws a black rectangle at (28, 71) with width 57 and height 52. Then Draws a purple line from (146, 41) to (196, 8).
; PLAN: r0=28(x), r1=71(y), r2=57(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=146(x1), r1=41(y1), r2=196(x2), r3=8(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black rectangle at (28, 71) with width 57 and height 52.
; PLAN: r0=28(x), r1=71(y), r2=57(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 71
LDI r2, 57
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple line from (146, 41) to (196, 8).
; PLAN: r0=146(x1), r1=41(y1), r2=196(x2), r3=8(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 41
LDI r2, 196
LDI r3, 8
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
