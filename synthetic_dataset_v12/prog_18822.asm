; DESCRIPTION: Renders a green box of size 119x99 starting at (333, 42).
; PLAN: r0=333(x), r1=42(y), r2=119(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 42
LDI r2, 119
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
