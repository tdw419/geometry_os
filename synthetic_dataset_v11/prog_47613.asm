; DESCRIPTION: Renders a cyan box of size 34x82 starting at (22, 47).
; PLAN: r0=22(x), r1=47(y), r2=34(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 47
LDI r2, 34
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
