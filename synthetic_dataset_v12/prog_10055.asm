; DESCRIPTION: Places a green 24x62 rectangle at position (81, 68).
; PLAN: r0=81(x), r1=68(y), r2=24(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 68
LDI r2, 24
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
