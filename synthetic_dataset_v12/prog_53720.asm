; DESCRIPTION: Places a black 14x56 rectangle at position (410, 58).
; PLAN: r0=410(x), r1=58(y), r2=14(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 58
LDI r2, 14
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
