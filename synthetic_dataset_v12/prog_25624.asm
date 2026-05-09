; DESCRIPTION: Places a yellow 92x31 rectangle at position (111, 1).
; PLAN: r0=111(x), r1=1(y), r2=92(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 1
LDI r2, 92
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
