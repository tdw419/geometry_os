; DESCRIPTION: Creates a yellow rectangular region at (89, 215) spanning 120 by 21 pixels.
; PLAN: r0=89(x), r1=215(y), r2=120(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 215
LDI r2, 120
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
