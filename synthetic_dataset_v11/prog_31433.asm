; DESCRIPTION: Renders a green box of size 75x10 starting at (120, 192).
; PLAN: r0=120(x), r1=192(y), r2=75(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 192
LDI r2, 75
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
