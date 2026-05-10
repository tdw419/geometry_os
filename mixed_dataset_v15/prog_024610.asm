; DESCRIPTION: Creates a purple rectangular region at (419, 129) spanning 50 by 32 pixels.
; PLAN: r0=419(x), r1=129(y), r2=50(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 129
LDI r2, 50
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
