; DESCRIPTION: Places a white 108x99 rectangle at position (93, 103).
; PLAN: r0=93(x), r1=103(y), r2=108(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 103
LDI r2, 108
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
