; DESCRIPTION: Places a white 113x76 rectangle at position (84, 149).
; PLAN: r0=84(x), r1=149(y), r2=113(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 149
LDI r2, 113
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
