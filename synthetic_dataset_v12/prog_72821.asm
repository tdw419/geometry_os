; DESCRIPTION: Places a yellow 64x112 rectangle at position (326, 80).
; PLAN: r0=326(x), r1=80(y), r2=64(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 80
LDI r2, 64
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
