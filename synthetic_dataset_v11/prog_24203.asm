; DESCRIPTION: Renders a cyan box of size 112x18 starting at (69, 85).
; PLAN: r0=69(x), r1=85(y), r2=112(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 85
LDI r2, 112
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
