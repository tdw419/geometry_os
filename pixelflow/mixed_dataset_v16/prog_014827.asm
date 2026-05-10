; DESCRIPTION: Renders a cyan box of size 65x100 starting at (408, 96).
; PLAN: r0=408(x), r1=96(y), r2=65(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 96
LDI r2, 65
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
