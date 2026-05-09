; DESCRIPTION: Places a green 117x103 rectangle at position (50, 137).
; PLAN: r0=50(x), r1=137(y), r2=117(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 137
LDI r2, 117
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
