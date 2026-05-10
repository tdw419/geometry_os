; DESCRIPTION: Creates a orange filled rectangle of size 51x25 starting at (123, 103).
; PLAN: r0=123(x), r1=103(y), r2=51(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 103
LDI r2, 51
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
