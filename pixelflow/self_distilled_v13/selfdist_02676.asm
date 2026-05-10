; DESCRIPTION: Creates a blue filled rectangle of size 61x86 starting at (274, 103).
; PLAN: r0=274(x), r1=103(y), r2=61(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 103
LDI r2, 61
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
