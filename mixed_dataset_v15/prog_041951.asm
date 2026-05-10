; DESCRIPTION: Places a black 90x71 rectangle at position (44, 58).
; PLAN: r0=44(x), r1=58(y), r2=90(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 58
LDI r2, 90
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
