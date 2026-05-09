; DESCRIPTION: Renders a blue box of size 47x17 starting at (232, 143).
; PLAN: r0=232(x), r1=143(y), r2=47(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 143
LDI r2, 47
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
