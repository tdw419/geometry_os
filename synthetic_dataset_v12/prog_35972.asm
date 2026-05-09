; DESCRIPTION: Creates a blue rectangular region at (419, 206) spanning 74 by 42 pixels.
; PLAN: r0=419(x), r1=206(y), r2=74(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 206
LDI r2, 74
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
