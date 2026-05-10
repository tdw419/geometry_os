; DESCRIPTION: Renders a green rectangular region spanning 50 by 29 at (210, 82).
; PLAN: r0=210(x), r1=82(y), r2=50(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 82
LDI r2, 50
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
