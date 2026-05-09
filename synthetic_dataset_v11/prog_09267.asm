; DESCRIPTION: Places a magenta 78x119 rectangle at position (171, 121).
; PLAN: r0=171(x), r1=121(y), r2=78(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 121
LDI r2, 78
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
