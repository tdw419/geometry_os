; DESCRIPTION: Renders a white box of size 107x40 starting at (92, 180).
; PLAN: r0=92(x), r1=180(y), r2=107(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 180
LDI r2, 107
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
