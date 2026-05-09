; DESCRIPTION: Places a black 67x77 rectangle at position (27, 34).
; PLAN: r0=27(x), r1=34(y), r2=67(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 34
LDI r2, 67
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
