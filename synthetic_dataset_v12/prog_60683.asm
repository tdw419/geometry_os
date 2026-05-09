; DESCRIPTION: Places a red 112x116 rectangle at position (78, 134).
; PLAN: r0=78(x), r1=134(y), r2=112(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 134
LDI r2, 112
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
