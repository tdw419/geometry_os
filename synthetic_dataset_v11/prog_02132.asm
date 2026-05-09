; DESCRIPTION: Places a magenta 64x59 rectangle at position (130, 196).
; PLAN: r0=130(x), r1=196(y), r2=64(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 196
LDI r2, 64
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
