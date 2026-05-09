; DESCRIPTION: Places a blue 106x16 rectangle at position (36, 238).
; PLAN: r0=36(x), r1=238(y), r2=106(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 238
LDI r2, 106
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
