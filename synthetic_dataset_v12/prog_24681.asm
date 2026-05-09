; DESCRIPTION: Creates a green rectangular region at (214, 171) spanning 20 by 61 pixels.
; PLAN: r0=214(x), r1=171(y), r2=20(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 171
LDI r2, 20
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
