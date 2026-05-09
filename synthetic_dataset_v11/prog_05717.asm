; DESCRIPTION: Renders a green box of size 50x11 starting at (120, 145).
; PLAN: r0=120(x), r1=145(y), r2=50(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 145
LDI r2, 50
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
