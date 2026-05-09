; DESCRIPTION: Places a white 73x83 rectangle at position (247, 46).
; PLAN: r0=247(x), r1=46(y), r2=73(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 46
LDI r2, 73
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
