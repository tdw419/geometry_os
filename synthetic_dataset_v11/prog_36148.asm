; DESCRIPTION: Places a green 76x93 rectangle at position (112, 30).
; PLAN: r0=112(x), r1=30(y), r2=76(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 30
LDI r2, 76
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
