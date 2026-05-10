; DESCRIPTION: Renders a green box of size 63x47 starting at (406, 116).
; PLAN: r0=406(x), r1=116(y), r2=63(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 116
LDI r2, 63
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
