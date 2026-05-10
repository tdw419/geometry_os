; DESCRIPTION: Renders a cyan box of size 16x111 starting at (49, 85).
; PLAN: r0=49(x), r1=85(y), r2=16(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 85
LDI r2, 16
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
