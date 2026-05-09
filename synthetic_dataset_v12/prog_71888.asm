; DESCRIPTION: Places a yellow 12x17 rectangle at position (120, 86).
; PLAN: r0=120(x), r1=86(y), r2=12(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 86
LDI r2, 12
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
