; DESCRIPTION: Places a black 96x59 rectangle at position (307, 114).
; PLAN: r0=307(x), r1=114(y), r2=96(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 114
LDI r2, 96
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
