; DESCRIPTION: Places a yellow 32x48 rectangle at position (83, 50).
; PLAN: r0=83(x), r1=50(y), r2=32(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 50
LDI r2, 32
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
