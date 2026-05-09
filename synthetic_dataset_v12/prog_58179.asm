; DESCRIPTION: Places a green 37x19 rectangle at position (68, 93).
; PLAN: r0=68(x), r1=93(y), r2=37(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 93
LDI r2, 37
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
