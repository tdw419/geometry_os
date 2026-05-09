; DESCRIPTION: Places a blue 77x64 rectangle at position (355, 157).
; PLAN: r0=355(x), r1=157(y), r2=77(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 157
LDI r2, 77
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
