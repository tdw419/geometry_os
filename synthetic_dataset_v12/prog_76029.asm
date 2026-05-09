; DESCRIPTION: Renders a green box of size 21x46 starting at (372, 153).
; PLAN: r0=372(x), r1=153(y), r2=21(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 153
LDI r2, 21
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
