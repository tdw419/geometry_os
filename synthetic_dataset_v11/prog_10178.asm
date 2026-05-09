; DESCRIPTION: Creates a purple rectangular region at (33, 177) spanning 75 by 10 pixels.
; PLAN: r0=33(x), r1=177(y), r2=75(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 177
LDI r2, 75
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
