; DESCRIPTION: Renders a magenta box of size 78x25 starting at (320, 12).
; PLAN: r0=320(x), r1=12(y), r2=78(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 12
LDI r2, 78
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
