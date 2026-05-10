; DESCRIPTION: Creates a blue filled rectangle of size 28x27 starting at (124, 143).
; PLAN: r0=124(x), r1=143(y), r2=28(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 143
LDI r2, 28
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
