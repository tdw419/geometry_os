; DESCRIPTION: Places a black 39x58 rectangle at position (228, 114).
; PLAN: r0=228(x), r1=114(y), r2=39(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 114
LDI r2, 39
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
