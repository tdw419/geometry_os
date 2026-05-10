; DESCRIPTION: Creates a blue rectangular region at (236, 1) spanning 120 by 117 pixels.
; PLAN: r0=236(x), r1=1(y), r2=120(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 1
LDI r2, 120
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
