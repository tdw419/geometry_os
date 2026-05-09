; DESCRIPTION: Composite: . Then Draws a red rectangle at (28, 47) with width 74 and height 120. Then Draws a purple line from (115, 213) to (138, 74).
; PLAN: r0=28(x), r1=47(y), r2=74(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=115(x1), r1=213(y1), r2=138(x2), r3=74(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red rectangle at (28, 47) with width 74 and height 120.
; PLAN: r0=28(x), r1=47(y), r2=74(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 47
LDI r2, 74
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple line from (115, 213) to (138, 74).
; PLAN: r0=115(x1), r1=213(y1), r2=138(x2), r3=74(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 213
LDI r2, 138
LDI r3, 74
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
