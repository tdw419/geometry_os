; DESCRIPTION: Places a red 29x20 rectangle at position (199, 115).
; PLAN: r0=199(x), r1=115(y), r2=29(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 115
LDI r2, 29
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
