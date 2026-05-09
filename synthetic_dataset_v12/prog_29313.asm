; DESCRIPTION: Places a white 78x33 rectangle at position (191, 28).
; PLAN: r0=191(x), r1=28(y), r2=78(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 28
LDI r2, 78
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
