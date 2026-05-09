; DESCRIPTION: Places a white 30x73 rectangle at position (59, 164).
; PLAN: r0=59(x), r1=164(y), r2=30(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 164
LDI r2, 30
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
