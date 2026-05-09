; DESCRIPTION: Renders a yellow box of size 107x11 starting at (228, 70).
; PLAN: r0=228(x), r1=70(y), r2=107(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 70
LDI r2, 107
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
