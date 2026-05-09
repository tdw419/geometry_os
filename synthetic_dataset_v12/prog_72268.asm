; DESCRIPTION: Creates a green rectangular region at (111, 171) spanning 109 by 45 pixels.
; PLAN: r0=111(x), r1=171(y), r2=109(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 171
LDI r2, 109
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
