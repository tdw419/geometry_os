; DESCRIPTION: Creates a blue rectangular region at (202, 120) spanning 13 by 32 pixels.
; PLAN: r0=202(x), r1=120(y), r2=13(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 120
LDI r2, 13
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
