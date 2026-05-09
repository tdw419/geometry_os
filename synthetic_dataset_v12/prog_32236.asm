; DESCRIPTION: Renders a magenta box of size 41x98 starting at (420, 107).
; PLAN: r0=420(x), r1=107(y), r2=41(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 107
LDI r2, 41
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
