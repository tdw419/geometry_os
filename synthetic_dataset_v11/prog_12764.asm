; DESCRIPTION: Composite: . Then Renders a yellow line between points (150, 130) and (69, 81). Then Places a purple 105x88 rectangle at position (82, 67).
; PLAN: r0=150(x1), r1=130(y1), r2=69(x2), r3=81(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=82(x), r1=67(y), r2=105(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow line between points (150, 130) and (69, 81).
; PLAN: r0=150(x1), r1=130(y1), r2=69(x2), r3=81(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 130
LDI r2, 69
LDI r3, 81
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple 105x88 rectangle at position (82, 67).
; PLAN: r0=82(x), r1=67(y), r2=105(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 67
LDI r2, 105
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
