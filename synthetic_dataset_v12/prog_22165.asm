; DESCRIPTION: Places a white 60x101 rectangle at position (414, 28).
; PLAN: r0=414(x), r1=28(y), r2=60(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 28
LDI r2, 60
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
