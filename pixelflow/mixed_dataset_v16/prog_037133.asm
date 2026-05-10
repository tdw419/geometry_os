; DESCRIPTION: Places a red 112x34 rectangle at position (119, 25).
; PLAN: r0=119(x), r1=25(y), r2=112(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 25
LDI r2, 112
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
