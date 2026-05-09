; DESCRIPTION: Places a blue 74x59 rectangle at position (92, 189).
; PLAN: r0=92(x), r1=189(y), r2=74(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 189
LDI r2, 74
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
