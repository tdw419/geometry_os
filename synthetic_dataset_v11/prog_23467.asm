; DESCRIPTION: Places a red 38x23 rectangle at position (0, 175).
; PLAN: r0=0(x), r1=175(y), r2=38(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 175
LDI r2, 38
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
