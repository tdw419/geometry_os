; DESCRIPTION: Places a white 38x71 rectangle at position (369, 13).
; PLAN: r0=369(x), r1=13(y), r2=38(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 13
LDI r2, 38
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
