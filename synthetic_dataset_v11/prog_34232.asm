; DESCRIPTION: Places a cyan 114x80 rectangle at position (27, 43).
; PLAN: r0=27(x), r1=43(y), r2=114(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 43
LDI r2, 114
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
