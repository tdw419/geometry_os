; DESCRIPTION: Renders a magenta box of size 91x24 starting at (130, 164).
; PLAN: r0=130(x), r1=164(y), r2=91(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 164
LDI r2, 91
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
