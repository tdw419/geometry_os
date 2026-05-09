; DESCRIPTION: Places a cyan 96x14 rectangle at position (369, 185).
; PLAN: r0=369(x), r1=185(y), r2=96(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 185
LDI r2, 96
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
