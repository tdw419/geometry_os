; DESCRIPTION: Places a green 111x17 rectangle at position (318, 134).
; PLAN: r0=318(x), r1=134(y), r2=111(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 134
LDI r2, 111
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
