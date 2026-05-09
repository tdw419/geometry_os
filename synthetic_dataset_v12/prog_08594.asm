; DESCRIPTION: Renders a yellow box of size 43x42 starting at (410, 199).
; PLAN: r0=410(x), r1=199(y), r2=43(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 199
LDI r2, 43
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
