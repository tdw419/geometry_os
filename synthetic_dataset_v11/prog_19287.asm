; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (149, 82) to (125, 99). Then Creates a red rectangular region at (41, 101) spanning 108 by 83 pixels.
; PLAN: r0=149(x1), r1=82(y1), r2=125(x2), r3=99(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=41(x), r1=101(y), r2=108(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow line segment connecting (149, 82) to (125, 99).
; PLAN: r0=149(x1), r1=82(y1), r2=125(x2), r3=99(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 82
LDI r2, 125
LDI r3, 99
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a red rectangular region at (41, 101) spanning 108 by 83 pixels.
; PLAN: r0=41(x), r1=101(y), r2=108(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 101
LDI r2, 108
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
