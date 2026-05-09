; DESCRIPTION: Places a cyan 17x63 rectangle at position (293, 128).
; PLAN: r0=293(x), r1=128(y), r2=17(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 128
LDI r2, 17
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
