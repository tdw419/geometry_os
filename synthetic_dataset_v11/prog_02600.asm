; DESCRIPTION: Renders a magenta box of size 65x41 starting at (61, 192).
; PLAN: r0=61(x), r1=192(y), r2=65(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 192
LDI r2, 65
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
