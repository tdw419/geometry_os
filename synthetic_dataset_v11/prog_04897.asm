; DESCRIPTION: Composite: . Then Draws a black rectangle at (6, 107) with width 104 and height 101. Then Renders a green line between points (173, 114) and (142, 167).
; PLAN: r0=6(x), r1=107(y), r2=104(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=173(x1), r1=114(y1), r2=142(x2), r3=167(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black rectangle at (6, 107) with width 104 and height 101.
; PLAN: r0=6(x), r1=107(y), r2=104(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 107
LDI r2, 104
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a green line between points (173, 114) and (142, 167).
; PLAN: r0=173(x1), r1=114(y1), r2=142(x2), r3=167(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 114
LDI r2, 142
LDI r3, 167
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
