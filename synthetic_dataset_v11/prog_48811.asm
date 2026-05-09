; DESCRIPTION: Composite: . Then Renders a yellow line between points (96, 254) and (150, 138). Then Renders a orange box of size 25x26 starting at (34, 79).
; PLAN: r0=96(x1), r1=254(y1), r2=150(x2), r3=138(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=34(x), r1=79(y), r2=25(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow line between points (96, 254) and (150, 138).
; PLAN: r0=96(x1), r1=254(y1), r2=150(x2), r3=138(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 254
LDI r2, 150
LDI r3, 138
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a orange box of size 25x26 starting at (34, 79).
; PLAN: r0=34(x), r1=79(y), r2=25(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 79
LDI r2, 25
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
