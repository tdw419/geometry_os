; DESCRIPTION: Creates a green rectangular region at (48, 168) spanning 16 by 14 pixels.
; PLAN: r0=48(x), r1=168(y), r2=16(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 168
LDI r2, 16
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
