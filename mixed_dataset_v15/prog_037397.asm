; DESCRIPTION: Renders a green box of size 29x55 starting at (273, 95).
; PLAN: r0=273(x), r1=95(y), r2=29(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 95
LDI r2, 29
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
