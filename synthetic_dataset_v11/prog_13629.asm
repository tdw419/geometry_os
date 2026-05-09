; DESCRIPTION: Composite: . Then Places a white circle of radius 71 at center (101, 98). Then Draws a black line from (182, 38) to (68, 224).
; PLAN: r0=101(x), r1=98(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=182(x1), r1=38(y1), r2=68(x2), r3=224(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white circle of radius 71 at center (101, 98).
; PLAN: r0=101(x), r1=98(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 98
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a black line from (182, 38) to (68, 224).
; PLAN: r0=182(x1), r1=38(y1), r2=68(x2), r3=224(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 38
LDI r2, 68
LDI r3, 224
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
