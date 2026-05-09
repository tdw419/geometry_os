; DESCRIPTION: Places a red 109x24 rectangle at position (326, 14).
; PLAN: r0=326(x), r1=14(y), r2=109(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 14
LDI r2, 109
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
