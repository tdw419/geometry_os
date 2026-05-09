; DESCRIPTION: Renders a cyan box of size 119x99 starting at (146, 100).
; PLAN: r0=146(x), r1=100(y), r2=119(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 100
LDI r2, 119
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
