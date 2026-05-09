; DESCRIPTION: Renders a magenta box of size 23x53 starting at (305, 135).
; PLAN: r0=305(x), r1=135(y), r2=23(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 135
LDI r2, 23
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
