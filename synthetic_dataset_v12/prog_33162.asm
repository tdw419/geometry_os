; DESCRIPTION: Places a yellow 92x36 rectangle at position (250, 168).
; PLAN: r0=250(x), r1=168(y), r2=92(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 168
LDI r2, 92
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
