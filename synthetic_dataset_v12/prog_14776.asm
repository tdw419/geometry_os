; DESCRIPTION: Renders a cyan box of size 19x15 starting at (438, 96).
; PLAN: r0=438(x), r1=96(y), r2=19(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 96
LDI r2, 19
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
