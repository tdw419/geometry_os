; DESCRIPTION: Places a red 59x102 rectangle at position (26, 50).
; PLAN: r0=26(x), r1=50(y), r2=59(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 50
LDI r2, 59
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
