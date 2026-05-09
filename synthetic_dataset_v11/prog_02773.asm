; DESCRIPTION: Places a white 33x103 rectangle at position (177, 28).
; PLAN: r0=177(x), r1=28(y), r2=33(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 28
LDI r2, 33
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
