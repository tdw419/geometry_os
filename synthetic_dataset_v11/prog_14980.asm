; DESCRIPTION: Renders a cyan box of size 30x98 starting at (209, 147).
; PLAN: r0=209(x), r1=147(y), r2=30(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 147
LDI r2, 30
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
