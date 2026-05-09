; DESCRIPTION: Places a red 59x43 rectangle at position (8, 137).
; PLAN: r0=8(x), r1=137(y), r2=59(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 137
LDI r2, 59
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
