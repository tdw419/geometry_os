; DESCRIPTION: Places a orange 16x103 box at position (327, 56).
; PLAN: r0=327(x), r1=56(y), r2=16(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 56
LDI r2, 16
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
