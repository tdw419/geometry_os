; DESCRIPTION: Creates a cyan rectangular region at (369, 114) spanning 24 by 75 pixels.
; PLAN: r0=369(x), r1=114(y), r2=24(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 114
LDI r2, 24
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
