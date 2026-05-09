; DESCRIPTION: Places a cyan 44x23 rectangle at position (226, 118).
; PLAN: r0=226(x), r1=118(y), r2=44(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 118
LDI r2, 44
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
