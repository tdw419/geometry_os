; DESCRIPTION: Composite: . Then Places a black 118x104 rectangle at position (124, 78). Then Places a white line segment connecting (168, 194) to (50, 209).
; PLAN: r0=124(x), r1=78(y), r2=118(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=168(x1), r1=194(y1), r2=50(x2), r3=209(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black 118x104 rectangle at position (124, 78).
; PLAN: r0=124(x), r1=78(y), r2=118(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 78
LDI r2, 118
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a white line segment connecting (168, 194) to (50, 209).
; PLAN: r0=168(x1), r1=194(y1), r2=50(x2), r3=209(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 194
LDI r2, 50
LDI r3, 209
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
