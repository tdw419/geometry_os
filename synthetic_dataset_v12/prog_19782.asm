; DESCRIPTION: Places a magenta 93x59 rectangle at position (226, 16).
; PLAN: r0=226(x), r1=16(y), r2=93(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 16
LDI r2, 93
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
