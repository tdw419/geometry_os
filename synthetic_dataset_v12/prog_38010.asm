; DESCRIPTION: Renders a purple box of size 75x82 starting at (197, 40).
; PLAN: r0=197(x), r1=40(y), r2=75(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 40
LDI r2, 75
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
