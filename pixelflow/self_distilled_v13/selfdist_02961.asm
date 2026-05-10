; DESCRIPTION: Creates a yellow filled rectangle of size 117x19 starting at (195, 196).
; PLAN: r0=195(x), r1=196(y), r2=117(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 196
LDI r2, 117
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
