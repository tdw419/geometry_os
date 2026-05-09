; DESCRIPTION: Places a blue 33x90 rectangle at position (413, 58).
; PLAN: r0=413(x), r1=58(y), r2=33(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 58
LDI r2, 33
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
