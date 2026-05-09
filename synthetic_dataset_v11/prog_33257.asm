; DESCRIPTION: Renders a green box of size 58x100 starting at (128, 16).
; PLAN: r0=128(x), r1=16(y), r2=58(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 16
LDI r2, 58
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
