; DESCRIPTION: Places a green 78x67 rectangle at position (133, 14).
; PLAN: r0=133(x), r1=14(y), r2=78(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 14
LDI r2, 78
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
