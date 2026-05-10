; DESCRIPTION: Places a blue 24x61 box at position (212, 184).
; PLAN: r0=212(x), r1=184(y), r2=24(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 184
LDI r2, 24
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
