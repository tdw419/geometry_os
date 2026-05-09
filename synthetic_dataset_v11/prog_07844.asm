; DESCRIPTION: Renders a cyan box of size 89x11 starting at (48, 71).
; PLAN: r0=48(x), r1=71(y), r2=89(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 71
LDI r2, 89
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
