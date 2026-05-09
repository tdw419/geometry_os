; DESCRIPTION: Creates a purple rectangular region at (387, 177) spanning 74 by 45 pixels.
; PLAN: r0=387(x), r1=177(y), r2=74(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 177
LDI r2, 74
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
