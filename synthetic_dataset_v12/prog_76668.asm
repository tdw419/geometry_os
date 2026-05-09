; DESCRIPTION: Renders a blue box of size 120x24 starting at (228, 34).
; PLAN: r0=228(x), r1=34(y), r2=120(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 34
LDI r2, 120
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
