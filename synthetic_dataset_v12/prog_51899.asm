; DESCRIPTION: Places a white 90x63 rectangle at position (113, 149).
; PLAN: r0=113(x), r1=149(y), r2=90(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 149
LDI r2, 90
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
