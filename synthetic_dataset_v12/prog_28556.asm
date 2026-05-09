; DESCRIPTION: Creates a purple rectangular region at (294, 179) spanning 94 by 38 pixels.
; PLAN: r0=294(x), r1=179(y), r2=94(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 179
LDI r2, 94
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
