; DESCRIPTION: Creates a green rectangular region at (9, 168) spanning 70 by 48 pixels.
; PLAN: r0=9(x), r1=168(y), r2=70(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 168
LDI r2, 70
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
