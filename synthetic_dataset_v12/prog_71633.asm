; DESCRIPTION: Places a yellow 59x51 rectangle at position (34, 48).
; PLAN: r0=34(x), r1=48(y), r2=59(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 48
LDI r2, 59
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
