; DESCRIPTION: Places a red 90x116 rectangle at position (31, 29).
; PLAN: r0=31(x), r1=29(y), r2=90(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 29
LDI r2, 90
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
