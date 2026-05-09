; DESCRIPTION: Places a magenta 55x68 rectangle at position (166, 52).
; PLAN: r0=166(x), r1=52(y), r2=55(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 52
LDI r2, 55
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
