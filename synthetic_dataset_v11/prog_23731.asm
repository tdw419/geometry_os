; DESCRIPTION: Places a orange 92x98 rectangle at position (61, 59).
; PLAN: r0=61(x), r1=59(y), r2=92(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 59
LDI r2, 92
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
