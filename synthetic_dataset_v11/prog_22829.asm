; DESCRIPTION: Places a cyan 85x109 rectangle at position (76, 93).
; PLAN: r0=76(x), r1=93(y), r2=85(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 93
LDI r2, 85
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
