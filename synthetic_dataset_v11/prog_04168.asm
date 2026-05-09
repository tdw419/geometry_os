; DESCRIPTION: Places a magenta 56x17 rectangle at position (171, 1).
; PLAN: r0=171(x), r1=1(y), r2=56(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 1
LDI r2, 56
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
