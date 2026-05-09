; DESCRIPTION: Renders a green box of size 75x83 starting at (385, 38).
; PLAN: r0=385(x), r1=38(y), r2=75(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 38
LDI r2, 75
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
