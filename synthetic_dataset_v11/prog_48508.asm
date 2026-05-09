; DESCRIPTION: Renders a magenta box of size 51x86 starting at (143, 76).
; PLAN: r0=143(x), r1=76(y), r2=51(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 76
LDI r2, 51
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
