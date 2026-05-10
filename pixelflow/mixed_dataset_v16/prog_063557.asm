; DESCRIPTION: Places a yellow 70x100 rectangle at position (282, 138).
; PLAN: r0=282(x), r1=138(y), r2=70(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 138
LDI r2, 70
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
