; DESCRIPTION: Renders a green box of size 40x120 starting at (63, 98).
; PLAN: r0=63(x), r1=98(y), r2=40(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 98
LDI r2, 40
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
