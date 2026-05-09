; DESCRIPTION: Places a yellow 67x42 rectangle at position (282, 140).
; PLAN: r0=282(x), r1=140(y), r2=67(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 140
LDI r2, 67
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
