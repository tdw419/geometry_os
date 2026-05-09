; DESCRIPTION: Renders a green box of size 95x26 starting at (394, 55).
; PLAN: r0=394(x), r1=55(y), r2=95(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 55
LDI r2, 95
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
