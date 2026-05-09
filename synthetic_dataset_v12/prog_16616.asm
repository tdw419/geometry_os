; DESCRIPTION: Places a green 13x53 rectangle at position (152, 158).
; PLAN: r0=152(x), r1=158(y), r2=13(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 158
LDI r2, 13
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
