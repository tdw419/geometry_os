; DESCRIPTION: Places a cyan 62x93 rectangle at position (87, 85).
; PLAN: r0=87(x), r1=85(y), r2=62(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 85
LDI r2, 62
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
