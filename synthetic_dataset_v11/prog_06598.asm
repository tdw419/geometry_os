; DESCRIPTION: Places a green 93x62 rectangle at position (65, 6).
; PLAN: r0=65(x), r1=6(y), r2=93(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 6
LDI r2, 93
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
