; DESCRIPTION: Places a yellow 109x82 rectangle at position (303, 21).
; PLAN: r0=303(x), r1=21(y), r2=109(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 21
LDI r2, 109
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
