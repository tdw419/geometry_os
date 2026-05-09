; DESCRIPTION: Creates a blue rectangular region at (143, 154) spanning 59 by 52 pixels.
; PLAN: r0=143(x), r1=154(y), r2=59(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 154
LDI r2, 59
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
