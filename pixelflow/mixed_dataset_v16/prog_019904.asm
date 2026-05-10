; DESCRIPTION: Places a yellow 100x111 rectangle at position (104, 132).
; PLAN: r0=104(x), r1=132(y), r2=100(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 132
LDI r2, 100
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
