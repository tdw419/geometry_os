; DESCRIPTION: Places a yellow 93x24 rectangle at position (300, 161).
; PLAN: r0=300(x), r1=161(y), r2=93(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 161
LDI r2, 93
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
