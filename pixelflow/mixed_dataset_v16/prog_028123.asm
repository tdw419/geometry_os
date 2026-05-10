; DESCRIPTION: Places a cyan 61x84 rectangle at position (115, 118).
; PLAN: r0=115(x), r1=118(y), r2=61(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 118
LDI r2, 61
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
