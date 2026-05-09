; DESCRIPTION: Renders a green box of size 75x48 starting at (152, 118).
; PLAN: r0=152(x), r1=118(y), r2=75(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 118
LDI r2, 75
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
