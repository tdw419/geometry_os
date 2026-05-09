; DESCRIPTION: Places a white 113x32 rectangle at position (268, 92).
; PLAN: r0=268(x), r1=92(y), r2=113(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 92
LDI r2, 113
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
