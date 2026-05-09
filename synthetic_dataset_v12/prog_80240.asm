; DESCRIPTION: Renders a green box of size 46x50 starting at (451, 173).
; PLAN: r0=451(x), r1=173(y), r2=46(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 173
LDI r2, 46
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
