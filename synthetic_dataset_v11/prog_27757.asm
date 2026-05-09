; DESCRIPTION: Composite: . Then Creates a red circular shape at (208, 38) with radius 15. Then Draws a orange line from (101, 242) to (21, 134).
; PLAN: r0=208(x), r1=38(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=101(x1), r1=242(y1), r2=21(x2), r3=134(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a red circular shape at (208, 38) with radius 15.
; PLAN: r0=208(x), r1=38(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 208
LDI r1, 38
LDI r2, 15
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a orange line from (101, 242) to (21, 134).
; PLAN: r0=101(x1), r1=242(y1), r2=21(x2), r3=134(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 242
LDI r2, 21
LDI r3, 134
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
