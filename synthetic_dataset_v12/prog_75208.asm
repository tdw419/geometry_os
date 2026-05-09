; DESCRIPTION: Renders a green box of size 90x45 starting at (302, 79).
; PLAN: r0=302(x), r1=79(y), r2=90(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 79
LDI r2, 90
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
