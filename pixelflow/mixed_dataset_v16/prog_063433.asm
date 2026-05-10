; DESCRIPTION: Creates a purple filled rectangle of size 96x19 starting at (41, 117).
; PLAN: r0=41(x), r1=117(y), r2=96(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 117
LDI r2, 96
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
