; DESCRIPTION: Renders a green box of size 83x60 starting at (280, 138).
; PLAN: r0=280(x), r1=138(y), r2=83(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 138
LDI r2, 83
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
