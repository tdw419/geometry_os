; DESCRIPTION: Creates a yellow rectangular region at (480, 226) spanning 30 by 25 pixels.
; PLAN: r0=480(x), r1=226(y), r2=30(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 226
LDI r2, 30
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
