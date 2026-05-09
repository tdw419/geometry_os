; DESCRIPTION: Creates a green rectangular region at (60, 107) spanning 68 by 53 pixels.
; PLAN: r0=60(x), r1=107(y), r2=68(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 107
LDI r2, 68
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
