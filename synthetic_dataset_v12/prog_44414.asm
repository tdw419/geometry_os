; DESCRIPTION: Places a black 47x114 rectangle at position (106, 27).
; PLAN: r0=106(x), r1=27(y), r2=47(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 27
LDI r2, 47
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
