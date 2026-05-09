; DESCRIPTION: Places a yellow 11x14 rectangle at position (264, 39).
; PLAN: r0=264(x), r1=39(y), r2=11(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 39
LDI r2, 11
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
