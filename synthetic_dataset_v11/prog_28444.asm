; DESCRIPTION: Places a yellow 98x111 rectangle at position (44, 72).
; PLAN: r0=44(x), r1=72(y), r2=98(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 72
LDI r2, 98
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
