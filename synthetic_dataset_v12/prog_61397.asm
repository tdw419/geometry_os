; DESCRIPTION: Places a white 109x66 rectangle at position (22, 133).
; PLAN: r0=22(x), r1=133(y), r2=109(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 133
LDI r2, 109
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
