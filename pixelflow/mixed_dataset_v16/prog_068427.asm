; DESCRIPTION: Creates a green rectangular region at (215, 160) spanning 10 by 57 pixels.
; PLAN: r0=215(x), r1=160(y), r2=10(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 160
LDI r2, 10
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
