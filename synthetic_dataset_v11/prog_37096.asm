; DESCRIPTION: Composite: . Then Places a green dot at position (133, 222). Then Creates a orange rectangular region at (148, 76) spanning 71 by 20 pixels.
; PLAN: r0=133(x), r1=222(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=148(x), r1=76(y), r2=71(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green dot at position (133, 222).
; PLAN: r0=133(x), r1=222(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 133
LDI r1, 222
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Creates a orange rectangular region at (148, 76) spanning 71 by 20 pixels.
; PLAN: r0=148(x), r1=76(y), r2=71(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 76
LDI r2, 71
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
