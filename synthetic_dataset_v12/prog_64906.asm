; DESCRIPTION: Renders a black box of size 21x11 starting at (281, 199).
; PLAN: r0=281(x), r1=199(y), r2=21(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 199
LDI r2, 21
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
