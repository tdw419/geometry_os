; DESCRIPTION: Renders a cyan box of size 21x119 starting at (341, 134).
; PLAN: r0=341(x), r1=134(y), r2=21(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 134
LDI r2, 21
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
