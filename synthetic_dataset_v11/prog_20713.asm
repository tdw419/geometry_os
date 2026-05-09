; DESCRIPTION: Composite: . Then Draws a black line from (30, 28) to (45, 148). Then Creates a yellow rectangular region at (74, 111) spanning 58 by 76 pixels.
; PLAN: r0=30(x1), r1=28(y1), r2=45(x2), r3=148(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=74(x), r1=111(y), r2=58(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black line from (30, 28) to (45, 148).
; PLAN: r0=30(x1), r1=28(y1), r2=45(x2), r3=148(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 28
LDI r2, 45
LDI r3, 148
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a yellow rectangular region at (74, 111) spanning 58 by 76 pixels.
; PLAN: r0=74(x), r1=111(y), r2=58(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 111
LDI r2, 58
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
