; DESCRIPTION: Composite: . Then Draws a black line from (46, 169) to (210, 78). Then Places a black 53x67 rectangle at position (115, 68).
; PLAN: r0=46(x1), r1=169(y1), r2=210(x2), r3=78(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=115(x), r1=68(y), r2=53(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black line from (46, 169) to (210, 78).
; PLAN: r0=46(x1), r1=169(y1), r2=210(x2), r3=78(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 169
LDI r2, 210
LDI r3, 78
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a black 53x67 rectangle at position (115, 68).
; PLAN: r0=115(x), r1=68(y), r2=53(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 68
LDI r2, 53
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
