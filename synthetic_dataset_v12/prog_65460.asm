; DESCRIPTION: Renders a yellow box of size 50x56 starting at (374, 56).
; PLAN: r0=374(x), r1=56(y), r2=50(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 56
LDI r2, 50
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
