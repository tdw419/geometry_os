; DESCRIPTION: Renders a green box of size 99x64 starting at (58, 183).
; PLAN: r0=58(x), r1=183(y), r2=99(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 183
LDI r2, 99
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
