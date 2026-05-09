; DESCRIPTION: Renders a green box of size 48x101 starting at (308, 148).
; PLAN: r0=308(x), r1=148(y), r2=48(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 148
LDI r2, 48
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
