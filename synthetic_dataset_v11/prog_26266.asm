; DESCRIPTION: Places a green 64x48 rectangle at position (190, 45).
; PLAN: r0=190(x), r1=45(y), r2=64(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 45
LDI r2, 64
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
