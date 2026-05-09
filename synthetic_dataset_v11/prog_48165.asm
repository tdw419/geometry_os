; DESCRIPTION: Places a red 14x40 rectangle at position (1, 181).
; PLAN: r0=1(x), r1=181(y), r2=14(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 181
LDI r2, 14
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
