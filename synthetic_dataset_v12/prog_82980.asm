; DESCRIPTION: Places a magenta 107x116 rectangle at position (289, 118).
; PLAN: r0=289(x), r1=118(y), r2=107(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 118
LDI r2, 107
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
