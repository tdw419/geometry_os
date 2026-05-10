; DESCRIPTION: Places a magenta 78x109 rectangle at position (17, 90).
; PLAN: r0=17(x), r1=90(y), r2=78(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 90
LDI r2, 78
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
