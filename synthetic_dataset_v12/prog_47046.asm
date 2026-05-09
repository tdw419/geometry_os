; DESCRIPTION: Creates a green rectangular region at (242, 5) spanning 45 by 24 pixels.
; PLAN: r0=242(x), r1=5(y), r2=45(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 5
LDI r2, 45
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
