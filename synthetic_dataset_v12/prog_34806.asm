; DESCRIPTION: Renders a blue box of size 47x92 starting at (44, 159).
; PLAN: r0=44(x), r1=159(y), r2=47(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 159
LDI r2, 47
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
