; DESCRIPTION: Creates a blue rectangular region at (487, 103) spanning 17 by 60 pixels.
; PLAN: r0=487(x), r1=103(y), r2=17(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 103
LDI r2, 17
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
