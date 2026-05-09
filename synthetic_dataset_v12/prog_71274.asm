; DESCRIPTION: Renders a green box of size 64x63 starting at (364, 113).
; PLAN: r0=364(x), r1=113(y), r2=64(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 113
LDI r2, 64
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
