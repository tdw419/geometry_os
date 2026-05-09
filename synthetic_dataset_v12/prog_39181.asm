; DESCRIPTION: Places a orange 25x42 rectangle at position (20, 75).
; PLAN: r0=20(x), r1=75(y), r2=25(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 75
LDI r2, 25
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
