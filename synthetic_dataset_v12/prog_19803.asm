; DESCRIPTION: Places a black 31x108 rectangle at position (39, 27).
; PLAN: r0=39(x), r1=27(y), r2=31(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 27
LDI r2, 31
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
