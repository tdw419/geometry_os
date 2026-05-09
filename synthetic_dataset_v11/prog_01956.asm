; DESCRIPTION: Places a red 99x24 rectangle at position (78, 133).
; PLAN: r0=78(x), r1=133(y), r2=99(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 133
LDI r2, 99
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
