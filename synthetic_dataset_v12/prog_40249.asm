; DESCRIPTION: Renders a magenta box of size 65x39 starting at (326, 14).
; PLAN: r0=326(x), r1=14(y), r2=65(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 14
LDI r2, 65
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
