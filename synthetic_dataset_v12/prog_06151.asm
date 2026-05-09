; DESCRIPTION: Renders a blue box of size 107x32 starting at (71, 150).
; PLAN: r0=71(x), r1=150(y), r2=107(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 150
LDI r2, 107
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
