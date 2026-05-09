; DESCRIPTION: Places a white 69x36 rectangle at position (168, 68).
; PLAN: r0=168(x), r1=68(y), r2=69(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 68
LDI r2, 69
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
