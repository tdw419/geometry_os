; DESCRIPTION: Composite: . Then Renders a orange line between points (70, 59) and (164, 108). Then Renders a black box of size 113x49 starting at (17, 53).
; PLAN: r0=70(x1), r1=59(y1), r2=164(x2), r3=108(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=17(x), r1=53(y), r2=113(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a orange line between points (70, 59) and (164, 108).
; PLAN: r0=70(x1), r1=59(y1), r2=164(x2), r3=108(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 59
LDI r2, 164
LDI r3, 108
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a black box of size 113x49 starting at (17, 53).
; PLAN: r0=17(x), r1=53(y), r2=113(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 53
LDI r2, 113
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
