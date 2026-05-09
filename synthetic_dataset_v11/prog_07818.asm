; DESCRIPTION: Composite: . Then Creates a black rectangular region at (4, 133) spanning 41 by 67 pixels. Then Renders a orange line between points (148, 14) and (213, 163).
; PLAN: r0=4(x), r1=133(y), r2=41(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=148(x1), r1=14(y1), r2=213(x2), r3=163(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a black rectangular region at (4, 133) spanning 41 by 67 pixels.
; PLAN: r0=4(x), r1=133(y), r2=41(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 133
LDI r2, 41
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a orange line between points (148, 14) and (213, 163).
; PLAN: r0=148(x1), r1=14(y1), r2=213(x2), r3=163(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 14
LDI r2, 213
LDI r3, 163
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
