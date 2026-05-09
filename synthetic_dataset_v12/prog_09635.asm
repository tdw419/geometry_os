; DESCRIPTION: Renders a cyan box of size 93x76 starting at (368, 110).
; PLAN: r0=368(x), r1=110(y), r2=93(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 110
LDI r2, 93
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
