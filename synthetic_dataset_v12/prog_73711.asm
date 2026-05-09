; DESCRIPTION: Places a yellow 15x49 rectangle at position (458, 110).
; PLAN: r0=458(x), r1=110(y), r2=15(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 110
LDI r2, 15
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
