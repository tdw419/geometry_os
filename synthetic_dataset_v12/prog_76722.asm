; DESCRIPTION: Places a yellow 71x83 rectangle at position (224, 139).
; PLAN: r0=224(x), r1=139(y), r2=71(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 139
LDI r2, 71
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
