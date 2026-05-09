; DESCRIPTION: Places a red 81x76 rectangle at position (119, 117).
; PLAN: r0=119(x), r1=117(y), r2=81(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 117
LDI r2, 81
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
