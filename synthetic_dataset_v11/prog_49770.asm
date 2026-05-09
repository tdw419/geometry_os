; DESCRIPTION: Places a orange 111x106 rectangle at position (42, 85).
; PLAN: r0=42(x), r1=85(y), r2=111(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 85
LDI r2, 111
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
