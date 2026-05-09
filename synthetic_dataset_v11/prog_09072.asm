; DESCRIPTION: Places a red 92x87 rectangle at position (19, 9).
; PLAN: r0=19(x), r1=9(y), r2=92(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 9
LDI r2, 92
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
