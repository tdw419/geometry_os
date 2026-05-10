; DESCRIPTION: Places a cyan 113x15 rectangle at position (69, 149).
; PLAN: r0=69(x), r1=149(y), r2=113(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 149
LDI r2, 113
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
