; DESCRIPTION: Renders a magenta box of size 16x39 starting at (222, 46).
; PLAN: r0=222(x), r1=46(y), r2=16(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 46
LDI r2, 16
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
