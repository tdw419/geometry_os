; DESCRIPTION: Places a yellow 92x49 rectangle at position (7, 3).
; PLAN: r0=7(x), r1=3(y), r2=92(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 3
LDI r2, 92
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
