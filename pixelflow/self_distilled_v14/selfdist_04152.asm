; DESCRIPTION: Creates a orange filled rectangle of size 51x74 starting at (253, 94).
; PLAN: r0=253(x), r1=94(y), r2=51(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 94
LDI r2, 51
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
