; DESCRIPTION: Places a blue 61x63 rectangle at position (1, 29).
; PLAN: r0=1(x), r1=29(y), r2=61(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 29
LDI r2, 61
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
