; DESCRIPTION: Places a white 33x99 rectangle at position (461, 83).
; PLAN: r0=461(x), r1=83(y), r2=33(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 83
LDI r2, 33
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
