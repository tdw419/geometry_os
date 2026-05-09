; DESCRIPTION: Places a yellow 40x76 rectangle at position (186, 0).
; PLAN: r0=186(x), r1=0(y), r2=40(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 0
LDI r2, 40
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
