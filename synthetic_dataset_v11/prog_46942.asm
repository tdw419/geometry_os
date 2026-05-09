; DESCRIPTION: Places a blue 52x111 rectangle at position (52, 56).
; PLAN: r0=52(x), r1=56(y), r2=52(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 56
LDI r2, 52
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
