; DESCRIPTION: Places a orange 90x81 box at position (60, 161).
; PLAN: r0=60(x), r1=161(y), r2=90(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 161
LDI r2, 90
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
