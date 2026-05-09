; DESCRIPTION: Places a green 108x85 rectangle at position (314, 14).
; PLAN: r0=314(x), r1=14(y), r2=108(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 14
LDI r2, 108
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
