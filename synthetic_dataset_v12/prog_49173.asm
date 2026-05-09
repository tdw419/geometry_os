; DESCRIPTION: Places a orange 81x112 rectangle at position (214, 84).
; PLAN: r0=214(x), r1=84(y), r2=81(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 84
LDI r2, 81
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
