; DESCRIPTION: Places a black 107x59 rectangle at position (6, 102).
; PLAN: r0=6(x), r1=102(y), r2=107(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 102
LDI r2, 107
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
