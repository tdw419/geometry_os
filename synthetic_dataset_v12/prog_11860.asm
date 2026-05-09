; DESCRIPTION: Places a green 59x15 rectangle at position (219, 169).
; PLAN: r0=219(x), r1=169(y), r2=59(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 169
LDI r2, 59
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
