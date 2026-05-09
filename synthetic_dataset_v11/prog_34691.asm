; DESCRIPTION: Renders a green box of size 24x105 starting at (186, 31).
; PLAN: r0=186(x), r1=31(y), r2=24(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 31
LDI r2, 24
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
