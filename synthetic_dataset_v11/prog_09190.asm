; DESCRIPTION: Renders a cyan box of size 113x65 starting at (115, 96).
; PLAN: r0=115(x), r1=96(y), r2=113(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 96
LDI r2, 113
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
