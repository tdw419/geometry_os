; DESCRIPTION: Places a yellow 106x40 rectangle at position (0, 36).
; PLAN: r0=0(x), r1=36(y), r2=106(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 36
LDI r2, 106
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
