; DESCRIPTION: Renders a green box of size 65x86 starting at (200, 142).
; PLAN: r0=200(x), r1=142(y), r2=65(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 142
LDI r2, 65
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
