; DESCRIPTION: Renders a magenta box of size 47x113 starting at (320, 85).
; PLAN: r0=320(x), r1=85(y), r2=47(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 85
LDI r2, 47
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
