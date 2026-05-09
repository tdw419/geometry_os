; DESCRIPTION: Places a yellow 59x70 rectangle at position (131, 132).
; PLAN: r0=131(x), r1=132(y), r2=59(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 132
LDI r2, 59
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
