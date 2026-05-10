; DESCRIPTION: Renders a magenta box of size 31x74 starting at (195, 161).
; PLAN: r0=195(x), r1=161(y), r2=31(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 161
LDI r2, 31
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
