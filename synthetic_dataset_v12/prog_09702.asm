; DESCRIPTION: Renders a yellow box of size 59x110 starting at (275, 37).
; PLAN: r0=275(x), r1=37(y), r2=59(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 37
LDI r2, 59
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
