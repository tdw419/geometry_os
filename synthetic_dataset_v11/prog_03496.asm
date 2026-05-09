; DESCRIPTION: Composite: . Then Renders a blue line between points (176, 88) and (64, 146). Then Creates a black rectangular region at (41, 82) spanning 102 by 24 pixels.
; PLAN: r0=176(x1), r1=88(y1), r2=64(x2), r3=146(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=41(x), r1=82(y), r2=102(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue line between points (176, 88) and (64, 146).
; PLAN: r0=176(x1), r1=88(y1), r2=64(x2), r3=146(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 88
LDI r2, 64
LDI r3, 146
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a black rectangular region at (41, 82) spanning 102 by 24 pixels.
; PLAN: r0=41(x), r1=82(y), r2=102(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 82
LDI r2, 102
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
