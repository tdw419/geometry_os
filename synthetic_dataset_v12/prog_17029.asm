; DESCRIPTION: Renders a magenta box of size 65x44 starting at (406, 55).
; PLAN: r0=406(x), r1=55(y), r2=65(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 55
LDI r2, 65
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
