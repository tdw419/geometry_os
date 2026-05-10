; DESCRIPTION: Places a yellow 76x100 rectangle at position (197, 54).
; PLAN: r0=197(x), r1=54(y), r2=76(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 54
LDI r2, 76
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
