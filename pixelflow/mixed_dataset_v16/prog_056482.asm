; DESCRIPTION: Renders a green box of size 119x30 starting at (25, 146).
; PLAN: r0=25(x), r1=146(y), r2=119(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 146
LDI r2, 119
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
