; DESCRIPTION: Places a orange 92x59 rectangle at position (17, 114).
; PLAN: r0=17(x), r1=114(y), r2=92(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 114
LDI r2, 92
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
