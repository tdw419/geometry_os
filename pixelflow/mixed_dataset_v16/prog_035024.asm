; DESCRIPTION: Places a white 118x21 rectangle at position (152, 171).
; PLAN: r0=152(x), r1=171(y), r2=118(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 171
LDI r2, 118
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
