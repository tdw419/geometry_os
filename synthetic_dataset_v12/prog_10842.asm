; DESCRIPTION: Renders a cyan box of size 14x29 starting at (178, 150).
; PLAN: r0=178(x), r1=150(y), r2=14(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 150
LDI r2, 14
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
