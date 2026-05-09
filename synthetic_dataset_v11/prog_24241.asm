; DESCRIPTION: Renders a green box of size 36x100 starting at (210, 5).
; PLAN: r0=210(x), r1=5(y), r2=36(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 5
LDI r2, 36
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
