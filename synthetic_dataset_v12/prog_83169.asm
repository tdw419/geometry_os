; DESCRIPTION: Places a orange 82x56 rectangle at position (110, 42).
; PLAN: r0=110(x), r1=42(y), r2=82(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 42
LDI r2, 82
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
