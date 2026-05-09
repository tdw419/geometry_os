; DESCRIPTION: Places a black 88x47 rectangle at position (369, 16).
; PLAN: r0=369(x), r1=16(y), r2=88(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 16
LDI r2, 88
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
