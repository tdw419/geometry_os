; DESCRIPTION: Places a yellow 16x56 rectangle at position (158, 92).
; PLAN: r0=158(x), r1=92(y), r2=16(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 92
LDI r2, 16
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
