; DESCRIPTION: Places a white 114x103 rectangle at position (210, 118).
; PLAN: r0=210(x), r1=118(y), r2=114(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 118
LDI r2, 114
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
