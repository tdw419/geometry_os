; DESCRIPTION: Composite: . Then Draws a black rectangle at (67, 11) with width 19 and height 70. Then Renders a magenta line between points (213, 32) and (144, 138).
; PLAN: r0=67(x), r1=11(y), r2=19(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=213(x1), r1=32(y1), r2=144(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black rectangle at (67, 11) with width 19 and height 70.
; PLAN: r0=67(x), r1=11(y), r2=19(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 11
LDI r2, 19
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta line between points (213, 32) and (144, 138).
; PLAN: r0=213(x1), r1=32(y1), r2=144(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 32
LDI r2, 144
LDI r3, 138
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
