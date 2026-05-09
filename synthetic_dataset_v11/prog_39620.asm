; DESCRIPTION: Places a red 62x111 rectangle at position (78, 44).
; PLAN: r0=78(x), r1=44(y), r2=62(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 44
LDI r2, 62
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
