; DESCRIPTION: Places a yellow 120x84 rectangle at position (118, 28).
; PLAN: r0=118(x), r1=28(y), r2=120(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 28
LDI r2, 120
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
