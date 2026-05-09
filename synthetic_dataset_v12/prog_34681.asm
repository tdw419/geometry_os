; DESCRIPTION: Places a red 108x18 rectangle at position (36, 18).
; PLAN: r0=36(x), r1=18(y), r2=108(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 18
LDI r2, 108
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
