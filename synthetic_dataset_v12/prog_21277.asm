; DESCRIPTION: Renders a cyan box of size 50x83 starting at (211, 163).
; PLAN: r0=211(x), r1=163(y), r2=50(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 163
LDI r2, 50
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
