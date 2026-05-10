; DESCRIPTION: Places a cyan 93x72 rectangle at position (93, 38).
; PLAN: r0=93(x), r1=38(y), r2=93(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 38
LDI r2, 93
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
