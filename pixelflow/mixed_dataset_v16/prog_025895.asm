; DESCRIPTION: Renders a white rectangular region spanning 24 by 93 at (374, 197).
; PLAN: r0=374(x), r1=197(y), r2=24(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 197
LDI r2, 24
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
