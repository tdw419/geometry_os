; DESCRIPTION: Places a blue 61x29 rectangle at position (106, 212).
; PLAN: r0=106(x), r1=212(y), r2=61(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 212
LDI r2, 61
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
