; DESCRIPTION: Places a cyan 114x23 rectangle at position (27, 219).
; PLAN: r0=27(x), r1=219(y), r2=114(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 219
LDI r2, 114
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
