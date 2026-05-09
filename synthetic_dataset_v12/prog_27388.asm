; DESCRIPTION: Renders a cyan box of size 95x31 starting at (60, 20).
; PLAN: r0=60(x), r1=20(y), r2=95(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 20
LDI r2, 95
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
