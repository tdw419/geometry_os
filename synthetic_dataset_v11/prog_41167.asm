; DESCRIPTION: Renders a cyan box of size 60x34 starting at (193, 178).
; PLAN: r0=193(x), r1=178(y), r2=60(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 178
LDI r2, 60
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
