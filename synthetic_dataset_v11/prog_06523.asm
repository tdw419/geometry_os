; DESCRIPTION: Renders a cyan box of size 45x77 starting at (203, 95).
; PLAN: r0=203(x), r1=95(y), r2=45(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 95
LDI r2, 45
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
