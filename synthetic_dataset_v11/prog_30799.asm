; DESCRIPTION: Renders a green box of size 117x90 starting at (83, 121).
; PLAN: r0=83(x), r1=121(y), r2=117(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 121
LDI r2, 117
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
