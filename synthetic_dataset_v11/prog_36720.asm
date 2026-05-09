; DESCRIPTION: Creates a green rectangular region at (210, 187) spanning 27 by 22 pixels.
; PLAN: r0=210(x), r1=187(y), r2=27(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 187
LDI r2, 27
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
