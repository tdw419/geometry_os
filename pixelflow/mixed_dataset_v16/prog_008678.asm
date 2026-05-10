; DESCRIPTION: Renders a white box of size 63x113 starting at (62, 82).
; PLAN: r0=62(x), r1=82(y), r2=63(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 82
LDI r2, 63
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
