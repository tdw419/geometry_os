; DESCRIPTION: Places a yellow 111x109 rectangle at position (251, 15).
; PLAN: r0=251(x), r1=15(y), r2=111(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 15
LDI r2, 111
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
