; DESCRIPTION: Renders a magenta box of size 42x112 starting at (171, 107).
; PLAN: r0=171(x), r1=107(y), r2=42(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 107
LDI r2, 42
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
