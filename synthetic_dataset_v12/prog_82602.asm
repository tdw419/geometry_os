; DESCRIPTION: Renders a white box of size 24x29 starting at (92, 86).
; PLAN: r0=92(x), r1=86(y), r2=24(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 86
LDI r2, 24
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
