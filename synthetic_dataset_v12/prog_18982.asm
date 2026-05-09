; DESCRIPTION: Places a orange 53x74 rectangle at position (127, 112).
; PLAN: r0=127(x), r1=112(y), r2=53(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 112
LDI r2, 53
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
