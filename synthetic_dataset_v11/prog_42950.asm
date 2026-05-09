; DESCRIPTION: Places a green 103x98 rectangle at position (69, 35).
; PLAN: r0=69(x), r1=35(y), r2=103(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 35
LDI r2, 103
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
