; DESCRIPTION: Places a yellow 11x49 rectangle at position (226, 109).
; PLAN: r0=226(x), r1=109(y), r2=11(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 109
LDI r2, 11
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
