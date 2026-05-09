; DESCRIPTION: Renders a cyan box of size 71x80 starting at (181, 78).
; PLAN: r0=181(x), r1=78(y), r2=71(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 78
LDI r2, 71
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
