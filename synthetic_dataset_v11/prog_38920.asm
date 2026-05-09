; DESCRIPTION: Composite: . Then Places a orange line segment connecting (67, 254) to (193, 21). Then Creates a red rectangular region at (25, 87) spanning 60 by 41 pixels.
; PLAN: r0=67(x1), r1=254(y1), r2=193(x2), r3=21(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=25(x), r1=87(y), r2=60(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange line segment connecting (67, 254) to (193, 21).
; PLAN: r0=67(x1), r1=254(y1), r2=193(x2), r3=21(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 254
LDI r2, 193
LDI r3, 21
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a red rectangular region at (25, 87) spanning 60 by 41 pixels.
; PLAN: r0=25(x), r1=87(y), r2=60(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 87
LDI r2, 60
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
