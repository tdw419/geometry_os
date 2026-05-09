; DESCRIPTION: Places a green 98x64 rectangle at position (76, 69).
; PLAN: r0=76(x), r1=69(y), r2=98(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 69
LDI r2, 98
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
