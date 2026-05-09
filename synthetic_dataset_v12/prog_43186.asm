; DESCRIPTION: Places a green 62x93 rectangle at position (246, 58).
; PLAN: r0=246(x), r1=58(y), r2=62(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 58
LDI r2, 62
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
