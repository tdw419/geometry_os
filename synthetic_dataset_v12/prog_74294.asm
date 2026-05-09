; DESCRIPTION: Places a green 99x82 rectangle at position (246, 58).
; PLAN: r0=246(x), r1=58(y), r2=99(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 58
LDI r2, 99
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
