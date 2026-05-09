; DESCRIPTION: Places a magenta 59x98 rectangle at position (77, 3).
; PLAN: r0=77(x), r1=3(y), r2=59(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 3
LDI r2, 59
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
