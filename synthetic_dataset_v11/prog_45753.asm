; DESCRIPTION: Renders a green box of size 47x12 starting at (65, 208).
; PLAN: r0=65(x), r1=208(y), r2=47(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 208
LDI r2, 47
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
