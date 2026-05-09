; DESCRIPTION: Creates a green rectangular region at (354, 131) spanning 107 by 69 pixels.
; PLAN: r0=354(x), r1=131(y), r2=107(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 131
LDI r2, 107
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
