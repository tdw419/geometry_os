; DESCRIPTION: Places a orange 42x15 rectangle at position (208, 148).
; PLAN: r0=208(x), r1=148(y), r2=42(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 148
LDI r2, 42
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
