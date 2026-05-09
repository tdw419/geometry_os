; DESCRIPTION: Renders a magenta box of size 41x86 starting at (73, 122).
; PLAN: r0=73(x), r1=122(y), r2=41(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 122
LDI r2, 41
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
