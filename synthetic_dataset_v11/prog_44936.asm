; DESCRIPTION: Composite: . Then Creates a yellow rectangular region at (30, 44) spanning 41 by 52 pixels. Then Places a white line segment connecting (127, 149) to (244, 114).
; PLAN: r0=30(x), r1=44(y), r2=41(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=127(x1), r1=149(y1), r2=244(x2), r3=114(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a yellow rectangular region at (30, 44) spanning 41 by 52 pixels.
; PLAN: r0=30(x), r1=44(y), r2=41(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 44
LDI r2, 41
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a white line segment connecting (127, 149) to (244, 114).
; PLAN: r0=127(x1), r1=149(y1), r2=244(x2), r3=114(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 149
LDI r2, 244
LDI r3, 114
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
