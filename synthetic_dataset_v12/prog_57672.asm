; DESCRIPTION: Places a white 107x114 rectangle at position (268, 113).
; PLAN: r0=268(x), r1=113(y), r2=107(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 113
LDI r2, 107
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
