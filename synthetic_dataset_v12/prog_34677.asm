; DESCRIPTION: Places a magenta 59x110 rectangle at position (301, 125).
; PLAN: r0=301(x), r1=125(y), r2=59(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 125
LDI r2, 59
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
