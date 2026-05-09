; DESCRIPTION: Places a white 118x112 rectangle at position (369, 79).
; PLAN: r0=369(x), r1=79(y), r2=118(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 79
LDI r2, 118
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
