; DESCRIPTION: Places a orange 13x42 rectangle at position (135, 79).
; PLAN: r0=135(x), r1=79(y), r2=13(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 79
LDI r2, 13
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
