; DESCRIPTION: Places a red 114x35 rectangle at position (330, 171).
; PLAN: r0=330(x), r1=171(y), r2=114(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 171
LDI r2, 114
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
