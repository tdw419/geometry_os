; DESCRIPTION: Renders a cyan box of size 60x95 starting at (193, 88).
; PLAN: r0=193(x), r1=88(y), r2=60(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 88
LDI r2, 60
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
