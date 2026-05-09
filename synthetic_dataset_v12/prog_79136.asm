; DESCRIPTION: Renders a green box of size 83x55 starting at (354, 197).
; PLAN: r0=354(x), r1=197(y), r2=83(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 197
LDI r2, 83
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
