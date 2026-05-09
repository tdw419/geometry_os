; DESCRIPTION: Places a green 12x100 rectangle at position (36, 43).
; PLAN: r0=36(x), r1=43(y), r2=12(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 43
LDI r2, 12
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
