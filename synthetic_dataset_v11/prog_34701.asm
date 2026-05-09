; DESCRIPTION: Renders a cyan box of size 105x52 starting at (149, 189).
; PLAN: r0=149(x), r1=189(y), r2=105(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 189
LDI r2, 105
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
