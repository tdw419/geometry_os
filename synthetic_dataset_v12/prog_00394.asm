; DESCRIPTION: Places a red 23x62 rectangle at position (36, 189).
; PLAN: r0=36(x), r1=189(y), r2=23(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 189
LDI r2, 23
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
