; DESCRIPTION: Places a green 11x67 rectangle at position (190, 48).
; PLAN: r0=190(x), r1=48(y), r2=11(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 48
LDI r2, 11
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
