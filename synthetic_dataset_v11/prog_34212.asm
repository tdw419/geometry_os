; DESCRIPTION: Places a yellow 69x97 rectangle at position (95, 42).
; PLAN: r0=95(x), r1=42(y), r2=69(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 42
LDI r2, 69
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
