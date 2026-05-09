; DESCRIPTION: Places a white 34x112 rectangle at position (148, 119).
; PLAN: r0=148(x), r1=119(y), r2=34(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 119
LDI r2, 34
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
