; DESCRIPTION: Places a cyan 27x114 rectangle at position (94, 106).
; PLAN: r0=94(x), r1=106(y), r2=27(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 106
LDI r2, 27
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
