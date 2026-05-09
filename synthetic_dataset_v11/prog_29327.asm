; DESCRIPTION: Places a green 100x82 rectangle at position (65, 56).
; PLAN: r0=65(x), r1=56(y), r2=100(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 56
LDI r2, 100
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
