; DESCRIPTION: Places a black 70x102 rectangle at position (9, 60).
; PLAN: r0=9(x), r1=60(y), r2=70(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 60
LDI r2, 70
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
