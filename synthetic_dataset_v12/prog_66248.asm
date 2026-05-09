; DESCRIPTION: Renders a magenta box of size 44x71 starting at (406, 70).
; PLAN: r0=406(x), r1=70(y), r2=44(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 70
LDI r2, 44
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
