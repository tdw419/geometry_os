; DESCRIPTION: Renders a green box of size 60x103 starting at (124, 85).
; PLAN: r0=124(x), r1=85(y), r2=60(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 85
LDI r2, 60
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
