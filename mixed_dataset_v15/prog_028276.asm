; DESCRIPTION: Renders a cyan box of size 71x11 starting at (60, 15).
; PLAN: r0=60(x), r1=15(y), r2=71(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 15
LDI r2, 71
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
