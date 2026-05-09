; DESCRIPTION: Places a yellow 65x15 rectangle at position (150, 186).
; PLAN: r0=150(x), r1=186(y), r2=65(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 186
LDI r2, 65
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
