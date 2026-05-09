; DESCRIPTION: Places a red 61x97 rectangle at position (59, 99).
; PLAN: r0=59(x), r1=99(y), r2=61(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 99
LDI r2, 61
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
