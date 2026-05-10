; DESCRIPTION: Places a red 109x35 rectangle at position (191, 158).
; PLAN: r0=191(x), r1=158(y), r2=109(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 158
LDI r2, 109
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
