; DESCRIPTION: Renders a green box of size 92x30 starting at (302, 83).
; PLAN: r0=302(x), r1=83(y), r2=92(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 83
LDI r2, 92
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
