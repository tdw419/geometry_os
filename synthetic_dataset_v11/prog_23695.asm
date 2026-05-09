; DESCRIPTION: Renders a magenta box of size 53x91 starting at (202, 80).
; PLAN: r0=202(x), r1=80(y), r2=53(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 80
LDI r2, 53
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
