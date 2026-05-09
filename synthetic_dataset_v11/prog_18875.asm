; DESCRIPTION: Places a cyan 118x39 rectangle at position (9, 100).
; PLAN: r0=9(x), r1=100(y), r2=118(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 100
LDI r2, 118
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
