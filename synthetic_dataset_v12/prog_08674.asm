; DESCRIPTION: Places a red 76x92 rectangle at position (18, 17).
; PLAN: r0=18(x), r1=17(y), r2=76(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 17
LDI r2, 76
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
