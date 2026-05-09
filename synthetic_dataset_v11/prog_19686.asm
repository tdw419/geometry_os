; DESCRIPTION: Places a white 28x31 rectangle at position (175, 171).
; PLAN: r0=175(x), r1=171(y), r2=28(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 171
LDI r2, 28
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
