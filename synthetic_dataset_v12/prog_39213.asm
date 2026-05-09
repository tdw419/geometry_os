; DESCRIPTION: Places a yellow 91x45 rectangle at position (90, 157).
; PLAN: r0=90(x), r1=157(y), r2=91(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 157
LDI r2, 91
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
