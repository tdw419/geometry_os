; DESCRIPTION: Renders a magenta box of size 104x19 starting at (252, 193).
; PLAN: r0=252(x), r1=193(y), r2=104(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 193
LDI r2, 104
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
