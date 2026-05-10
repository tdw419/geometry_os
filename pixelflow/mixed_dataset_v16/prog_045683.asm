; DESCRIPTION: Places a orange 24x53 rectangle at position (60, 155).
; PLAN: r0=60(x), r1=155(y), r2=24(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 155
LDI r2, 24
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
