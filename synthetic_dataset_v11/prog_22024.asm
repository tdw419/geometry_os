; DESCRIPTION: Composite: . Then Renders a black line between points (96, 106) and (34, 45). Then Renders a orange box of size 65x78 starting at (62, 79).
; PLAN: r0=96(x1), r1=106(y1), r2=34(x2), r3=45(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=62(x), r1=79(y), r2=65(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black line between points (96, 106) and (34, 45).
; PLAN: r0=96(x1), r1=106(y1), r2=34(x2), r3=45(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 106
LDI r2, 34
LDI r3, 45
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a orange box of size 65x78 starting at (62, 79).
; PLAN: r0=62(x), r1=79(y), r2=65(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 79
LDI r2, 65
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
