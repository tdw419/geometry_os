; DESCRIPTION: Places a orange 36x84 rectangle at position (24, 169).
; PLAN: r0=24(x), r1=169(y), r2=36(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 169
LDI r2, 36
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
