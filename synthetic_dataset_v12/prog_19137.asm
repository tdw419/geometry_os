; DESCRIPTION: Renders a green box of size 56x47 starting at (207, 96).
; PLAN: r0=207(x), r1=96(y), r2=56(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 96
LDI r2, 56
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
