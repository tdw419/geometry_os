; DESCRIPTION: Renders a cyan box of size 65x49 starting at (126, 119).
; PLAN: r0=126(x), r1=119(y), r2=65(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 119
LDI r2, 65
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
