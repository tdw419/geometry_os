; DESCRIPTION: Places a yellow 114x90 rectangle at position (322, 163).
; PLAN: r0=322(x), r1=163(y), r2=114(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 163
LDI r2, 114
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
