; DESCRIPTION: Renders a cyan box of size 116x40 starting at (136, 150).
; PLAN: r0=136(x), r1=150(y), r2=116(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 150
LDI r2, 116
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
