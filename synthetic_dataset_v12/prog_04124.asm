; DESCRIPTION: Creates a blue rectangular region at (297, 236) spanning 45 by 13 pixels.
; PLAN: r0=297(x), r1=236(y), r2=45(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 236
LDI r2, 45
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
