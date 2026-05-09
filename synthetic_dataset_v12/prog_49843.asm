; DESCRIPTION: Places a yellow 63x59 rectangle at position (357, 140).
; PLAN: r0=357(x), r1=140(y), r2=63(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 140
LDI r2, 63
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
