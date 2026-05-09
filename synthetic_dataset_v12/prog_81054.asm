; DESCRIPTION: Places a white 86x72 rectangle at position (251, 171).
; PLAN: r0=251(x), r1=171(y), r2=86(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 171
LDI r2, 86
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
