; DESCRIPTION: Renders a green box of size 50x48 starting at (265, 78).
; PLAN: r0=265(x), r1=78(y), r2=50(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 78
LDI r2, 50
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
