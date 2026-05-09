; DESCRIPTION: Places a orange 42x32 rectangle at position (146, 110).
; PLAN: r0=146(x), r1=110(y), r2=42(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 110
LDI r2, 42
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
