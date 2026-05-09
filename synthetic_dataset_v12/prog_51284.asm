; DESCRIPTION: Renders a cyan box of size 48x21 starting at (194, 119).
; PLAN: r0=194(x), r1=119(y), r2=48(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 119
LDI r2, 48
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
