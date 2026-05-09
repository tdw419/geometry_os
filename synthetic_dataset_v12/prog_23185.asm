; DESCRIPTION: Renders a magenta box of size 111x76 starting at (380, 44).
; PLAN: r0=380(x), r1=44(y), r2=111(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 44
LDI r2, 111
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
