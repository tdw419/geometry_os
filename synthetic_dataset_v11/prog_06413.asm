; DESCRIPTION: Places a black 33x75 rectangle at position (114, 83).
; PLAN: r0=114(x), r1=83(y), r2=33(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 83
LDI r2, 33
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
