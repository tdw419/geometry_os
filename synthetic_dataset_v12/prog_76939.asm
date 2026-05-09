; DESCRIPTION: Renders a magenta box of size 41x100 starting at (260, 150).
; PLAN: r0=260(x), r1=150(y), r2=41(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 150
LDI r2, 41
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
