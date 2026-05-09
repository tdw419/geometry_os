; DESCRIPTION: Creates a green rectangular region at (168, 117) spanning 51 by 86 pixels.
; PLAN: r0=168(x), r1=117(y), r2=51(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 117
LDI r2, 51
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
