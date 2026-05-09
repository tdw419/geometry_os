; DESCRIPTION: Places a purple 12x102 rectangle at position (410, 105).
; PLAN: r0=410(x), r1=105(y), r2=12(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 105
LDI r2, 12
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
