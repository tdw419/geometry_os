; DESCRIPTION: Creates a green rectangular region at (146, 168) spanning 105 by 72 pixels.
; PLAN: r0=146(x), r1=168(y), r2=105(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 168
LDI r2, 105
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
