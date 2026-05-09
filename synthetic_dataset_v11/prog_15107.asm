; DESCRIPTION: Places a white 107x31 rectangle at position (30, 59).
; PLAN: r0=30(x), r1=59(y), r2=107(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 59
LDI r2, 107
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
