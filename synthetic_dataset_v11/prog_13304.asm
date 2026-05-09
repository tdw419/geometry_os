; DESCRIPTION: Places a red 10x14 rectangle at position (108, 181).
; PLAN: r0=108(x), r1=181(y), r2=10(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 181
LDI r2, 10
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
