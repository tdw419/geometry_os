; DESCRIPTION: Renders a cyan box of size 60x119 starting at (95, 36).
; PLAN: r0=95(x), r1=36(y), r2=60(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 36
LDI r2, 60
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
