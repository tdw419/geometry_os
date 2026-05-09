; DESCRIPTION: Places a white 81x65 rectangle at position (171, 152).
; PLAN: r0=171(x), r1=152(y), r2=81(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 152
LDI r2, 81
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
