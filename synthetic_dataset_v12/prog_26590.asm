; DESCRIPTION: Places a orange 16x79 rectangle at position (164, 69).
; PLAN: r0=164(x), r1=69(y), r2=16(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 69
LDI r2, 16
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
