; DESCRIPTION: Places a orange 42x73 rectangle at position (103, 4).
; PLAN: r0=103(x), r1=4(y), r2=42(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 4
LDI r2, 42
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
