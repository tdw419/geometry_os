; DESCRIPTION: Places a red 70x102 rectangle at position (414, 44).
; PLAN: r0=414(x), r1=44(y), r2=70(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 44
LDI r2, 70
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
