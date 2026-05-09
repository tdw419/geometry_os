; DESCRIPTION: Renders a cyan box of size 43x20 starting at (95, 135).
; PLAN: r0=95(x), r1=135(y), r2=43(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 135
LDI r2, 43
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
