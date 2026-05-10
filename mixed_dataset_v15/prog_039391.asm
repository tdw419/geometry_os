; DESCRIPTION: Creates a blue filled rectangle of size 84x32 starting at (27, 190).
; PLAN: r0=27(x), r1=190(y), r2=84(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 190
LDI r2, 84
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
