; DESCRIPTION: Composite: . Then Places a white 114x76 rectangle at position (60, 30). Then Renders a black line between points (58, 86) and (150, 85).
; PLAN: r0=60(x), r1=30(y), r2=114(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=58(x1), r1=86(y1), r2=150(x2), r3=85(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white 114x76 rectangle at position (60, 30).
; PLAN: r0=60(x), r1=30(y), r2=114(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 30
LDI r2, 114
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a black line between points (58, 86) and (150, 85).
; PLAN: r0=58(x1), r1=86(y1), r2=150(x2), r3=85(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 86
LDI r2, 150
LDI r3, 85
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
