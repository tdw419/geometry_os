; DESCRIPTION: Places a orange 85x67 box at position (268, 25).
; PLAN: r0=268(x), r1=25(y), r2=85(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 25
LDI r2, 85
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
