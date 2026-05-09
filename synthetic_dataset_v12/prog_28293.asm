; DESCRIPTION: Renders a green box of size 13x55 starting at (322, 143).
; PLAN: r0=322(x), r1=143(y), r2=13(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 143
LDI r2, 13
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
