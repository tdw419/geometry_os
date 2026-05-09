; DESCRIPTION: Places a cyan 114x96 rectangle at position (193, 156).
; PLAN: r0=193(x), r1=156(y), r2=114(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 156
LDI r2, 114
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
