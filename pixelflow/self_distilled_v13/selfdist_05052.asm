; DESCRIPTION: Creates a blue filled rectangle of size 56x59 starting at (389, 107).
; PLAN: r0=389(x), r1=107(y), r2=56(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 107
LDI r2, 56
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
