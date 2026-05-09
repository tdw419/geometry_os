; DESCRIPTION: Places a yellow 103x91 rectangle at position (107, 139).
; PLAN: r0=107(x), r1=139(y), r2=103(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 139
LDI r2, 103
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
