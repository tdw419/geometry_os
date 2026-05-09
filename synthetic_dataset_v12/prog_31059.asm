; DESCRIPTION: Places a black 114x86 rectangle at position (171, 43).
; PLAN: r0=171(x), r1=43(y), r2=114(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 43
LDI r2, 114
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
