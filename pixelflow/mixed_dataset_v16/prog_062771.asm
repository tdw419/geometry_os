; DESCRIPTION: Places a red 112x47 box at position (264, 116).
; PLAN: r0=264(x), r1=116(y), r2=112(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 116
LDI r2, 112
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
