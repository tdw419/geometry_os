; DESCRIPTION: Composite: Creates a blue rectangular region at (403, 62) spanning 91 by 88 pixels then Places a yellow dot at position (330, 205).
; PLAN: r0=403(x), r1=62(y), r2=91(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=330(x), r6=205(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 403
LDI r1, 62
LDI r2, 91
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 330
LDI r6, 205
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
