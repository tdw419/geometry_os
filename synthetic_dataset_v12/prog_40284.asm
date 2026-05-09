; DESCRIPTION: Places a white 73x33 rectangle at position (167, 29).
; PLAN: r0=167(x), r1=29(y), r2=73(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 29
LDI r2, 73
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
