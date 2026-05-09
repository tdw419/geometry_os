; DESCRIPTION: Places a red 116x59 rectangle at position (56, 168).
; PLAN: r0=56(x), r1=168(y), r2=116(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 168
LDI r2, 116
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
