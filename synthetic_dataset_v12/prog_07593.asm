; DESCRIPTION: Places a yellow 96x23 rectangle at position (102, 170).
; PLAN: r0=102(x), r1=170(y), r2=96(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 170
LDI r2, 96
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
