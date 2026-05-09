; DESCRIPTION: Places a yellow 52x55 rectangle at position (312, 170).
; PLAN: r0=312(x), r1=170(y), r2=52(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 170
LDI r2, 52
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
