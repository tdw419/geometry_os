; DESCRIPTION: Places a white 90x90 rectangle at position (74, 15).
; PLAN: r0=74(x), r1=15(y), r2=90(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 15
LDI r2, 90
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
