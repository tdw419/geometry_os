; DESCRIPTION: Places a orange 96x109 rectangle at position (307, 69).
; PLAN: r0=307(x), r1=69(y), r2=96(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 69
LDI r2, 96
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
