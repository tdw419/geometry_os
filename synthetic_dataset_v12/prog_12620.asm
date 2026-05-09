; DESCRIPTION: Renders a cyan box of size 120x62 starting at (89, 20).
; PLAN: r0=89(x), r1=20(y), r2=120(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 20
LDI r2, 120
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
