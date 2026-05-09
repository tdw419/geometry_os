; DESCRIPTION: Places a cyan 93x74 rectangle at position (151, 100).
; PLAN: r0=151(x), r1=100(y), r2=93(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 100
LDI r2, 93
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
