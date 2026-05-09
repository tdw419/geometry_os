; DESCRIPTION: Places a green 71x93 rectangle at position (150, 12).
; PLAN: r0=150(x), r1=12(y), r2=71(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 12
LDI r2, 71
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
