; DESCRIPTION: Renders a cyan box of size 85x95 starting at (116, 76).
; PLAN: r0=116(x), r1=76(y), r2=85(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 76
LDI r2, 85
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
