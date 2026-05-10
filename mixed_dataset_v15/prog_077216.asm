; DESCRIPTION: Places a red 110x11 rectangle at position (14, 171).
; PLAN: r0=14(x), r1=171(y), r2=110(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 171
LDI r2, 110
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
