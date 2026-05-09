; DESCRIPTION: Places a white 108x113 rectangle at position (212, 136).
; PLAN: r0=212(x), r1=136(y), r2=108(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 136
LDI r2, 108
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
