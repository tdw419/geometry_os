; DESCRIPTION: Places a yellow 32x54 rectangle at position (203, 92).
; PLAN: r0=203(x), r1=92(y), r2=32(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 92
LDI r2, 32
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
