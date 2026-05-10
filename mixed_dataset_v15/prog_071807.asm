; DESCRIPTION: Places a cyan 25x102 rectangle at position (419, 97).
; PLAN: r0=419(x), r1=97(y), r2=25(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 97
LDI r2, 25
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
