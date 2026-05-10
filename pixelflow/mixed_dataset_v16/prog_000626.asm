; DESCRIPTION: Places a red 89x76 rectangle at position (150, 69).
; PLAN: r0=150(x), r1=69(y), r2=89(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 69
LDI r2, 89
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
