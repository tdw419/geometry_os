; DESCRIPTION: Places a yellow 23x27 rectangle at position (357, 71).
; PLAN: r0=357(x), r1=71(y), r2=23(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 71
LDI r2, 23
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
