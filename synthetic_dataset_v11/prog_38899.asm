; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (168, 30) to (128, 61). Then Creates a yellow rectangular region at (211, 19) spanning 41 by 115 pixels.
; PLAN: r0=168(x1), r1=30(y1), r2=128(x2), r3=61(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=211(x), r1=19(y), r2=41(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow line segment connecting (168, 30) to (128, 61).
; PLAN: r0=168(x1), r1=30(y1), r2=128(x2), r3=61(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 30
LDI r2, 128
LDI r3, 61
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a yellow rectangular region at (211, 19) spanning 41 by 115 pixels.
; PLAN: r0=211(x), r1=19(y), r2=41(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 19
LDI r2, 41
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
