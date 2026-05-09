; DESCRIPTION: Composite: . Then Places a blue 16x38 rectangle at position (73, 41). Then Renders a green line between points (49, 214) and (218, 85).
; PLAN: r0=73(x), r1=41(y), r2=16(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=49(x1), r1=214(y1), r2=218(x2), r3=85(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue 16x38 rectangle at position (73, 41).
; PLAN: r0=73(x), r1=41(y), r2=16(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 41
LDI r2, 16
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a green line between points (49, 214) and (218, 85).
; PLAN: r0=49(x1), r1=214(y1), r2=218(x2), r3=85(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 214
LDI r2, 218
LDI r3, 85
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
