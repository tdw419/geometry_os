; DESCRIPTION: Places a yellow 92x59 box at position (181, 164).
; PLAN: r0=181(x), r1=164(y), r2=92(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 164
LDI r2, 92
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
