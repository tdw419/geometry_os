; DESCRIPTION: Places a orange 96x35 rectangle at position (8, 134).
; PLAN: r0=8(x), r1=134(y), r2=96(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 134
LDI r2, 96
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
