; DESCRIPTION: Places a red 35x60 rectangle at position (24, 103).
; PLAN: r0=24(x), r1=103(y), r2=35(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 103
LDI r2, 35
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
