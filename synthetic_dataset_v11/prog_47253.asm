; DESCRIPTION: Places a red 17x17 rectangle at position (100, 65).
; PLAN: r0=100(x), r1=65(y), r2=17(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 65
LDI r2, 17
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
