; DESCRIPTION: Places a black 67x18 rectangle at position (405, 70).
; PLAN: r0=405(x), r1=70(y), r2=67(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 70
LDI r2, 67
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
