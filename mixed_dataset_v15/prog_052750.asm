; DESCRIPTION: Places a blue 61x25 rectangle at position (324, 196).
; PLAN: r0=324(x), r1=196(y), r2=61(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 196
LDI r2, 61
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
