; DESCRIPTION: Places a yellow 35x98 rectangle at position (418, 128).
; PLAN: r0=418(x), r1=128(y), r2=35(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 128
LDI r2, 35
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
