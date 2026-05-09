; DESCRIPTION: Places a black 50x17 rectangle at position (102, 100).
; PLAN: r0=102(x), r1=100(y), r2=50(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 100
LDI r2, 50
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
