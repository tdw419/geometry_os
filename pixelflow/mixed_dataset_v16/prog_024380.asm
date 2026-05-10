; DESCRIPTION: Renders a green box of size 86x44 starting at (389, 185).
; PLAN: r0=389(x), r1=185(y), r2=86(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 185
LDI r2, 86
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
