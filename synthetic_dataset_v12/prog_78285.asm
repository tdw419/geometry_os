; DESCRIPTION: Renders a magenta box of size 55x43 starting at (82, 187).
; PLAN: r0=82(x), r1=187(y), r2=55(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 187
LDI r2, 55
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
