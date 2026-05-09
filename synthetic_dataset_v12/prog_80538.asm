; DESCRIPTION: Renders a green box of size 63x76 starting at (387, 102).
; PLAN: r0=387(x), r1=102(y), r2=63(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 102
LDI r2, 63
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
