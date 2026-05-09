; DESCRIPTION: Places a red 36x96 rectangle at position (372, 35).
; PLAN: r0=372(x), r1=35(y), r2=36(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 35
LDI r2, 36
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
