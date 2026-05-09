; DESCRIPTION: Places a blue 19x103 rectangle at position (166, 79).
; PLAN: r0=166(x), r1=79(y), r2=19(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 79
LDI r2, 19
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
