; DESCRIPTION: Composite: . Then Places a red 26x23 rectangle at position (67, 114). Then Renders a white line between points (238, 230) and (196, 0).
; PLAN: r0=67(x), r1=114(y), r2=26(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=238(x1), r1=230(y1), r2=196(x2), r3=0(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red 26x23 rectangle at position (67, 114).
; PLAN: r0=67(x), r1=114(y), r2=26(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 114
LDI r2, 26
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a white line between points (238, 230) and (196, 0).
; PLAN: r0=238(x1), r1=230(y1), r2=196(x2), r3=0(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 230
LDI r2, 196
LDI r3, 0
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
