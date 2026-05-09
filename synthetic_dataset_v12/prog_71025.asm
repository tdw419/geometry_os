; DESCRIPTION: Places a red 97x70 rectangle at position (322, 71).
; PLAN: r0=322(x), r1=71(y), r2=97(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 71
LDI r2, 97
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
