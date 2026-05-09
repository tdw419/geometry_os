; DESCRIPTION: Places a blue 34x56 rectangle at position (28, 124).
; PLAN: r0=28(x), r1=124(y), r2=34(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 124
LDI r2, 34
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
