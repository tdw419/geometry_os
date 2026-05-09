; DESCRIPTION: Renders a cyan box of size 30x90 starting at (140, 66).
; PLAN: r0=140(x), r1=66(y), r2=30(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 66
LDI r2, 30
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
