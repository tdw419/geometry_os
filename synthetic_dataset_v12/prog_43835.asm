; DESCRIPTION: Places a yellow 64x72 rectangle at position (273, 52).
; PLAN: r0=273(x), r1=52(y), r2=64(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 52
LDI r2, 64
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
