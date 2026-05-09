; DESCRIPTION: Places a red 71x93 rectangle at position (122, 58).
; PLAN: r0=122(x), r1=58(y), r2=71(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 58
LDI r2, 71
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
