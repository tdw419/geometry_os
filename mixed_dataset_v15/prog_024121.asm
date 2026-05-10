; DESCRIPTION: Places a red 61x59 rectangle at position (81, 189).
; PLAN: r0=81(x), r1=189(y), r2=61(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 189
LDI r2, 61
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
