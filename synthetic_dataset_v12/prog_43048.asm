; DESCRIPTION: Creates a blue rectangular region at (398, 117) spanning 61 by 13 pixels.
; PLAN: r0=398(x), r1=117(y), r2=61(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 117
LDI r2, 61
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
