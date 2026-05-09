; DESCRIPTION: Places a black 103x113 rectangle at position (70, 114).
; PLAN: r0=70(x), r1=114(y), r2=103(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 114
LDI r2, 103
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
