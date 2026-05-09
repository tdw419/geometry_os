; DESCRIPTION: Places a black 67x113 rectangle at position (186, 99).
; PLAN: r0=186(x), r1=99(y), r2=67(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 99
LDI r2, 67
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
