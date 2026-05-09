; DESCRIPTION: Places a blue 33x48 rectangle at position (68, 148).
; PLAN: r0=68(x), r1=148(y), r2=33(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 148
LDI r2, 33
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
