; DESCRIPTION: Places a orange 113x79 rectangle at position (25, 14).
; PLAN: r0=25(x), r1=14(y), r2=113(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 14
LDI r2, 113
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
