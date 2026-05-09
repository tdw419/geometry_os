; DESCRIPTION: Places a white 88x80 rectangle at position (357, 169).
; PLAN: r0=357(x), r1=169(y), r2=88(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 169
LDI r2, 88
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
