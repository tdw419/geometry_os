; DESCRIPTION: Renders a green box of size 32x102 starting at (186, 104).
; PLAN: r0=186(x), r1=104(y), r2=32(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 104
LDI r2, 32
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
