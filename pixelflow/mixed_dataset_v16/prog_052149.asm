; DESCRIPTION: Creates a purple rectangular region at (240, 197) spanning 54 by 12 pixels.
; PLAN: r0=240(x), r1=197(y), r2=54(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 197
LDI r2, 54
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
