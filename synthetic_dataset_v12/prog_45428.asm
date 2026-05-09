; DESCRIPTION: Places a yellow 19x27 rectangle at position (57, 114).
; PLAN: r0=57(x), r1=114(y), r2=19(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 114
LDI r2, 19
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
