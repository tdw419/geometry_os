; DESCRIPTION: Places a orange 42x106 rectangle at position (148, 43).
; PLAN: r0=148(x), r1=43(y), r2=42(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 43
LDI r2, 42
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
