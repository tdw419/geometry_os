; DESCRIPTION: Places a yellow 29x50 rectangle at position (140, 91).
; PLAN: r0=140(x), r1=91(y), r2=29(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 91
LDI r2, 29
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
