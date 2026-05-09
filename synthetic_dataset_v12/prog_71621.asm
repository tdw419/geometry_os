; DESCRIPTION: Renders a magenta box of size 34x109 starting at (406, 140).
; PLAN: r0=406(x), r1=140(y), r2=34(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 140
LDI r2, 34
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
