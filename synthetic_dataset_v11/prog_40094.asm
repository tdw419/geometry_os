; DESCRIPTION: Places a cyan 14x113 rectangle at position (10, 69).
; PLAN: r0=10(x), r1=69(y), r2=14(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 69
LDI r2, 14
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
