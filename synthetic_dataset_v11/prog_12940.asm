; DESCRIPTION: Creates a blue rectangular region at (117, 21) spanning 42 by 13 pixels.
; PLAN: r0=117(x), r1=21(y), r2=42(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 21
LDI r2, 42
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
