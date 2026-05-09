; DESCRIPTION: Renders a green box of size 63x38 starting at (110, 38).
; PLAN: r0=110(x), r1=38(y), r2=63(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 38
LDI r2, 63
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
