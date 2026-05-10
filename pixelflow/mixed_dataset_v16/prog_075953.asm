; DESCRIPTION: Creates a green rectangular region at (206, 126) spanning 53 by 18 pixels.
; PLAN: r0=206(x), r1=126(y), r2=53(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 126
LDI r2, 53
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
