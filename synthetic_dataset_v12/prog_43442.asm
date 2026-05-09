; DESCRIPTION: Places a red 96x28 rectangle at position (369, 120).
; PLAN: r0=369(x), r1=120(y), r2=96(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 120
LDI r2, 96
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
