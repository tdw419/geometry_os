; DESCRIPTION: Places a black 93x48 rectangle at position (114, 33).
; PLAN: r0=114(x), r1=33(y), r2=93(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 33
LDI r2, 93
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
