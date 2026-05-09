; DESCRIPTION: Places a white 79x63 rectangle at position (138, 169).
; PLAN: r0=138(x), r1=169(y), r2=79(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 169
LDI r2, 79
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
