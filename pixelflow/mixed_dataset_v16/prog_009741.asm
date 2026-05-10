; DESCRIPTION: Renders a green box of size 58x21 starting at (165, 126).
; PLAN: r0=165(x), r1=126(y), r2=58(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 126
LDI r2, 58
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
