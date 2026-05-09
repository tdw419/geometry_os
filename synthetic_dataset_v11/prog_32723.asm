; DESCRIPTION: Composite: . Then Draws a orange line from (193, 40) to (62, 6). Then Renders a black box of size 99x48 starting at (53, 46).
; PLAN: r0=193(x1), r1=40(y1), r2=62(x2), r3=6(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=53(x), r1=46(y), r2=99(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange line from (193, 40) to (62, 6).
; PLAN: r0=193(x1), r1=40(y1), r2=62(x2), r3=6(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 40
LDI r2, 62
LDI r3, 6
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a black box of size 99x48 starting at (53, 46).
; PLAN: r0=53(x), r1=46(y), r2=99(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 46
LDI r2, 99
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
