; DESCRIPTION: Renders a cyan box of size 26x17 starting at (433, 163).
; PLAN: r0=433(x), r1=163(y), r2=26(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 163
LDI r2, 26
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
