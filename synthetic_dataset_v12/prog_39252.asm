; DESCRIPTION: Creates a blue rectangular region at (199, 126) spanning 32 by 60 pixels.
; PLAN: r0=199(x), r1=126(y), r2=32(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 126
LDI r2, 32
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
