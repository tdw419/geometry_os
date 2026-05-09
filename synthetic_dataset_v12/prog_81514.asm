; DESCRIPTION: Renders a blue box of size 98x82 starting at (370, 173).
; PLAN: r0=370(x), r1=173(y), r2=98(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 173
LDI r2, 98
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
