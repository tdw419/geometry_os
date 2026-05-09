; DESCRIPTION: Creates a purple rectangular region at (60, 197) spanning 16 by 52 pixels.
; PLAN: r0=60(x), r1=197(y), r2=16(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 197
LDI r2, 16
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
