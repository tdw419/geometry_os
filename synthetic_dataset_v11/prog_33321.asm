; DESCRIPTION: Places a red 55x29 rectangle at position (74, 75).
; PLAN: r0=74(x), r1=75(y), r2=55(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 75
LDI r2, 55
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
