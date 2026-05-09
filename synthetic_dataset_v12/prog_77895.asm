; DESCRIPTION: Places a green 119x23 rectangle at position (61, 68).
; PLAN: r0=61(x), r1=68(y), r2=119(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 68
LDI r2, 119
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
