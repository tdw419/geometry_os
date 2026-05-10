; DESCRIPTION: Creates a purple filled rectangle of size 41x48 starting at (232, 196).
; PLAN: r0=232(x), r1=196(y), r2=41(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 196
LDI r2, 41
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
