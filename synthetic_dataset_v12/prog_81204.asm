; DESCRIPTION: Creates a blue rectangular region at (410, 149) spanning 81 by 14 pixels.
; PLAN: r0=410(x), r1=149(y), r2=81(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 149
LDI r2, 81
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
