; DESCRIPTION: Places a red 33x33 rectangle at position (141, 181).
; PLAN: r0=141(x), r1=181(y), r2=33(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 181
LDI r2, 33
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
