; DESCRIPTION: Renders a green box of size 27x24 starting at (136, 228).
; PLAN: r0=136(x), r1=228(y), r2=27(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 228
LDI r2, 27
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
