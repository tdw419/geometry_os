; DESCRIPTION: Places a green 50x103 rectangle at position (119, 40).
; PLAN: r0=119(x), r1=40(y), r2=50(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 40
LDI r2, 50
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
