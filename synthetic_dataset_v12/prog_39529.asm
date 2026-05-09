; DESCRIPTION: Places a magenta 11x38 rectangle at position (160, 188).
; PLAN: r0=160(x), r1=188(y), r2=11(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 188
LDI r2, 11
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
