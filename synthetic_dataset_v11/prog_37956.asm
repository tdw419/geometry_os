; DESCRIPTION: Places a yellow 111x18 rectangle at position (70, 211).
; PLAN: r0=70(x), r1=211(y), r2=111(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 211
LDI r2, 111
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
