; DESCRIPTION: Places a yellow 15x63 rectangle at position (487, 64).
; PLAN: r0=487(x), r1=64(y), r2=15(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 64
LDI r2, 15
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
