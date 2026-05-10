; DESCRIPTION: Places a black 96x44 rectangle at position (119, 165).
; PLAN: r0=119(x), r1=165(y), r2=96(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 165
LDI r2, 96
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
