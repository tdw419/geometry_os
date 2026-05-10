; DESCRIPTION: Places a yellow 94x19 box at position (92, 168).
; PLAN: r0=92(x), r1=168(y), r2=94(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 168
LDI r2, 94
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
