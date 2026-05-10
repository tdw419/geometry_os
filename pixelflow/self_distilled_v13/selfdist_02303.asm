; DESCRIPTION: Places a orange 14x42 box at position (78, 91).
; PLAN: r0=78(x), r1=91(y), r2=14(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 91
LDI r2, 14
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
