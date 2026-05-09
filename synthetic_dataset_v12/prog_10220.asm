; DESCRIPTION: Places a magenta 17x120 rectangle at position (233, 41).
; PLAN: r0=233(x), r1=41(y), r2=17(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 41
LDI r2, 17
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
