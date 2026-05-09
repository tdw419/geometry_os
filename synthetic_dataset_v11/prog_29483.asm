; DESCRIPTION: Places a green 30x19 rectangle at position (34, 85).
; PLAN: r0=34(x), r1=85(y), r2=30(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 85
LDI r2, 30
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
