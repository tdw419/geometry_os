; DESCRIPTION: Composite: . Then Draws a orange line from (99, 128) to (119, 181). Then Renders a orange box of size 41x38 starting at (21, 149).
; PLAN: r0=99(x1), r1=128(y1), r2=119(x2), r3=181(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=21(x), r1=149(y), r2=41(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange line from (99, 128) to (119, 181).
; PLAN: r0=99(x1), r1=128(y1), r2=119(x2), r3=181(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 128
LDI r2, 119
LDI r3, 181
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a orange box of size 41x38 starting at (21, 149).
; PLAN: r0=21(x), r1=149(y), r2=41(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 149
LDI r2, 41
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
