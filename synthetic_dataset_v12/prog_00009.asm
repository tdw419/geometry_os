; DESCRIPTION: Renders a cyan box of size 72x24 starting at (179, 75).
; PLAN: r0=179(x), r1=75(y), r2=72(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 75
LDI r2, 72
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
