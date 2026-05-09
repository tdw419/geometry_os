; DESCRIPTION: Places a white 46x96 rectangle at position (56, 140).
; PLAN: r0=56(x), r1=140(y), r2=46(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 140
LDI r2, 46
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
