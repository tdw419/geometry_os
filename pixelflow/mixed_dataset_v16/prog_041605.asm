; DESCRIPTION: Places a yellow 67x92 rectangle at position (437, 3).
; PLAN: r0=437(x), r1=3(y), r2=67(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 3
LDI r2, 67
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
