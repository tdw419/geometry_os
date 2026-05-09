; DESCRIPTION: Composite: . Then Places a orange 31x92 rectangle at position (54, 41). Then Renders a red disk with center (55, 111) and radius 10.
; PLAN: r0=54(x), r1=41(y), r2=31(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=55(x), r1=111(y), r2=10(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a orange 31x92 rectangle at position (54, 41).
; PLAN: r0=54(x), r1=41(y), r2=31(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 41
LDI r2, 31
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red disk with center (55, 111) and radius 10.
; PLAN: r0=55(x), r1=111(y), r2=10(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 111
LDI r2, 10
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
