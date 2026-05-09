; DESCRIPTION: Places a black 93x33 rectangle at position (3, 28).
; PLAN: r0=3(x), r1=28(y), r2=93(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 28
LDI r2, 93
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
