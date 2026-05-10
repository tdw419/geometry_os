; DESCRIPTION: Renders a magenta box of size 65x76 starting at (178, 171).
; PLAN: r0=178(x), r1=171(y), r2=65(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 171
LDI r2, 65
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
