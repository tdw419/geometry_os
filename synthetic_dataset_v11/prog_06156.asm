; DESCRIPTION: Composite: . Then Creates a red rectangular region at (122, 82) spanning 83 by 71 pixels. Then Renders a orange line between points (251, 94) and (227, 240).
; PLAN: r0=122(x), r1=82(y), r2=83(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=251(x1), r1=94(y1), r2=227(x2), r3=240(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a red rectangular region at (122, 82) spanning 83 by 71 pixels.
; PLAN: r0=122(x), r1=82(y), r2=83(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 82
LDI r2, 83
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a orange line between points (251, 94) and (227, 240).
; PLAN: r0=251(x1), r1=94(y1), r2=227(x2), r3=240(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 94
LDI r2, 227
LDI r3, 240
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
