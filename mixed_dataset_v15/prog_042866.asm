; DESCRIPTION: Renders a blue box of size 82x45 starting at (70, 186).
; PLAN: r0=70(x), r1=186(y), r2=82(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 186
LDI r2, 82
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
