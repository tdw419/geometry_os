; DESCRIPTION: Creates a blue rectangular region at (301, 127) spanning 14 by 50 pixels.
; PLAN: r0=301(x), r1=127(y), r2=14(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 127
LDI r2, 14
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
