; DESCRIPTION: Renders a cyan box of size 118x48 starting at (30, 119).
; PLAN: r0=30(x), r1=119(y), r2=118(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 119
LDI r2, 118
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
