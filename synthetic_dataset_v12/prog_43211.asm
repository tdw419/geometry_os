; DESCRIPTION: Places a green 10x19 rectangle at position (325, 218).
; PLAN: r0=325(x), r1=218(y), r2=10(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 218
LDI r2, 10
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
